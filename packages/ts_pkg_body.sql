create or replace PACKAGE BODY ts_pkg AS 

    PROCEDURE claim_ticket (
        P_TICKET_ID NUMBER
    ) IS
        V_ROLE ts_users.role%TYPE;
        V_SUPPORT_ID ts_users.id%TYPE;
    BEGIN

        SELECT ID, ROLE
        INTO V_SUPPORT_ID, V_ROLE
        FROM TS_USERS
        WHERE LOWER(email) = LOWER(V('APP_USER'));

        IF V_ROLE IS NULL THEN
            RAISE_APPLICATION_ERROR(-20014, 'A role is required');
        END IF;

        IF V_ROLE NOT IN('Admin', 'Support') THEN
            RAISE_APPLICATION_ERROR(-20001, 'Not authorised to claim tickets');
        END IF;

        UPDATE TS_TICKETS
            SET ASSIGNED_TO = V_SUPPORT_ID,
            STATUS = 'Assigned'
            WHERE P_TICKET_ID = TS_TICKETS.ID
                AND STATUS IN('Unassigned', 'Reopened')
                AND ASSIGNED_TO IS NULL;

        IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Could not claim ticket');
        END IF;

        EXCEPTION
            WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20003, 'User account not found');

    END CLAIM_TICKET;

    PROCEDURE update_ticket_status (
        P_TICKET_ID NUMBER,
        P_NEW_STATUS VARCHAR2,
        P_RESOLUTION_NOTES VARCHAR2
    ) IS
        V_ROLE ts_users.role%TYPE;
        V_USER_ID ts_users.id%TYPE;
        V_ASSIGNED_TO ts_tickets.assigned_to%TYPE;
        V_CURRENT_STATUS ts_tickets.status%TYPE;
    BEGIN

        SELECT ID, ROLE
        INTO V_USER_ID, V_ROLE
        FROM TS_USERS
        WHERE LOWER(email) = LOWER(V('APP_USER'));

        IF P_NEW_STATUS IS NULL THEN
            RAISE_APPLICATION_ERROR(-20010, 'New ticket status is required');
        END IF;

        BEGIN

            SELECT ASSIGNED_TO, STATUS
            INTO V_ASSIGNED_TO, V_CURRENT_STATUS
            FROM TS_TICKETS
            WHERE ID = P_TICKET_ID;

            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    RAISE_APPLICATION_ERROR(-20006, 'Ticket not found');
        END;

        IF V_CURRENT_STATUS IS NULL THEN 
            RAISE_APPLICATION_ERROR(-20011, 'Current ticket status is required');
        END IF;

        IF V_CURRENT_STATUS = 'Resolved' AND P_NEW_STATUS = 'Reopened' AND V_ROLE <> 'Admin' THEN
            RAISE_APPLICATION_ERROR(-20007, 'Only Admins can reopen resolved tickets');
        END IF;

        IF V_CURRENT_STATUS = 'Resolved' AND P_NEW_STATUS NOT IN('Reopened', 'Closed') THEN
            RAISE_APPLICATION_ERROR(-20005, 'Invalid ticket status change');
        END IF;

        IF V_CURRENT_STATUS = 'Reopened' AND P_NEW_STATUS NOT IN('Assigned', 'Cancelled') THEN
            RAISE_APPLICATION_ERROR(-20005, 'Invalid ticket status change');
        END IF;

        IF V_CURRENT_STATUS = 'Closed' AND P_NEW_STATUS <> 'Reopened' THEN
            RAISE_APPLICATION_ERROR(-20005, 'Invalid ticket status change');
        END IF;

        IF V_CURRENT_STATUS = 'Closed' AND P_NEW_STATUS = 'Reopened' AND V_ROLE <> 'Admin' THEN
            RAISE_APPLICATION_ERROR(-20008, 'Only Admins can reopen closed tickets');
        END IF;

        IF V_CURRENT_STATUS = 'Unassigned' AND P_NEW_STATUS <> 'Cancelled' THEN
            RAISE_APPLICATION_ERROR(-20009, 'Ticket must be claimed before updating its status');
        END IF;

        IF V_CURRENT_STATUS = 'Cancelled' AND  P_NEW_STATUS <> 'Reopened' THEN
            RAISE_APPLICATION_ERROR(-20005, 'Invalid ticket status change');
        END IF;

        IF V_CURRENT_STATUS = 'Cancelled' AND P_NEW_STATUS = 'Reopened' AND V_ROLE <> 'Admin' THEN
            RAISE_APPLICATION_ERROR(-20013, 'Only Admins can reopen cancelled tickets');
        END IF;

        IF V_ASSIGNED_TO IS NULL AND P_NEW_STATUS NOT IN('Reopened', 'Cancelled') THEN
            RAISE_APPLICATION_ERROR(-20012, 'Ticket must have an assigned support employee');
        END IF;

        IF V_ROLE IS NULL THEN
            RAISE_APPLICATION_ERROR(-20014, 'A role is required');
        END IF;

        IF P_NEW_STATUS = 'Cancelled' AND V_ROLE <> 'Admin' THEN
            RAISE_APPLICATION_ERROR(-20017, 'Only Admins can cancel ticket');
        END IF;


        IF NOT (
            V_ROLE = 'Admin' OR (V_ROLE = 'Support' AND V_USER_ID = V_ASSIGNED_TO)
        ) THEN
            RAISE_APPLICATION_ERROR(-20004, 'User is not authorised to update the ticket status');
        END IF;

        IF V_CURRENT_STATUS = 'Pending' AND P_NEW_STATUS NOT IN('Resolved', 'In Progress', 'Cancelled') THEN
            RAISE_APPLICATION_ERROR(-20005, 'Invalid ticket status change');
        END IF;

        IF V_CURRENT_STATUS = 'In Progress' AND P_NEW_STATUS NOT IN('Resolved', 'Pending', 'Cancelled') THEN
            RAISE_APPLICATION_ERROR(-20005, 'Invalid ticket status change');
        END IF;

        IF V_CURRENT_STATUS = 'Assigned' AND P_NEW_STATUS NOT IN('Cancelled', 'In Progress') THEN
            RAISE_APPLICATION_ERROR(-20005, 'Invalid ticket status change');
        END IF;

        IF P_NEW_STATUS = 'Resolved' AND TRIM(P_RESOLUTION_NOTES) IS NULL THEN
            RAISE_APPLICATION_ERROR(-20016, 'Resolution notes are required');
        END IF;

        UPDATE TS_TICKETS
        SET STATUS = P_NEW_STATUS,
            RESOLVED_AT = CASE 
                WHEN P_NEW_STATUS = 'Resolved' THEN SYSDATE 
                WHEN P_NEW_STATUS = 'Reopened' THEN NULL
                ELSE RESOLVED_AT
            END,
            RESOLUTION_NOTES = CASE
                WHEN P_NEW_STATUS = 'Resolved' THEN P_RESOLUTION_NOTES
                WHEN P_NEW_STATUS = 'Reopened' THEN NULL
                ELSE RESOLUTION_NOTES
            END,
            ASSIGNED_TO = CASE
                WHEN P_NEW_STATUS = 'Reopened' THEN NULL
                ELSE ASSIGNED_TO
            END
        WHERE ID = P_TICKET_ID 
        AND STATUS = V_CURRENT_STATUS
        AND     (
                ASSIGNED_TO = V_ASSIGNED_TO
                    OR (ASSIGNED_TO IS NULL AND V_ASSIGNED_TO IS NULL)
            );

        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20015, 'Ticket status changed. Please try again');
        END IF;

        EXCEPTION
            WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20003, 'User account not found');

    END update_ticket_status;

    PROCEDURE close_ticket(
        p_ticket_id NUMBER
    ) 
    IS
    BEGIN
        UPDATE_TICKET_STATUS(
            P_TICKET_ID,
            'Closed',
            NULL
        );
    END close_ticket;


    PROCEDURE start_ticket(
        P_TICKET_ID NUMBER
    )
    IS
    BEGIN
        UPDATE_TICKET_STATUS(
            P_TICKET_ID,
            'In Progress',
            NULL
        );
    END start_ticket;

    PROCEDURE resolve_ticket(
        P_TICKET_ID NUMBER,
        P_RESOLUTION_NOTES VARCHAR2
    )
    IS
    BEGIN
        UPDATE_TICKET_STATUS(
            P_TICKET_ID,
            'Resolved',
            P_RESOLUTION_NOTES
        );
    END resolve_ticket;

    FUNCTION validate_title (
        P_TITLE VARCHAR2
    ) RETURN VARCHAR2
    IS
    BEGIN

        IF TRIM(P_TITLE) IS NULL THEN
            RETURN 'A title is required!';
        
        ELSE
            RETURN NULL;
        
        END IF;

    END validate_title;

    FUNCTION validate_description (
        P_DESCRIPTION CLOB
    ) RETURN VARCHAR2
    IS
    BEGIN

        IF TRIM(P_DESCRIPTION) IS NULL THEN
            RETURN 'A description is required!';
        
        ELSE
            RETURN NULL;

        END IF;

    END validate_description;

    FUNCTION validate_category (
        P_CATEGORY NUMBER
    ) RETURN VARCHAR2
    IS
    BEGIN

        IF P_CATEGORY IS NULL THEN
            RETURN 'A category is required!';
        
        ELSE
            RETURN NULL;
        
        END IF;

    END validate_category;

    FUNCTION validate_resolution_notes (
        P_STATUS VARCHAR2,
        P_RESOLUTION_NOTES VARCHAR2
    ) RETURN VARCHAR2
    IS
    BEGIN
        IF P_STATUS = 'Resolved'
        AND TRIM(P_RESOLUTION_NOTES) IS NULL THEN

            RETURN 'Resolution notes are required!';

        ELSE
            RETURN NULL;
        END IF;

    END validate_resolution_notes;

    FUNCTION populate_submitted_by(
        P_USERNAME VARCHAR2
    )  RETURN NUMBER
    IS
        v_submitted_by ts_tickets.submitted_by%TYPE;
    BEGIN

        SELECT id
        INTO v_submitted_by
        FROM ts_users
        WHERE LOWER(email) = LOWER(p_username);

        RETURN v_submitted_by;
    
    END populate_submitted_by;

    PROCEDURE add_comment (
        P_TICKET_ID NUMBER,
        P_COMMENT_TEXT VARCHAR2
    )
    IS
        V_USER_ID ts_users.id%TYPE;
        V_ROLE ts_users.role%TYPE;
        V_SUBMITTED_BY ts_tickets.submitted_by%TYPE;
        V_ASSIGNED_TO ts_tickets.assigned_to%TYPE;
        V_STATUS ts_tickets.status%TYPE;
        V_CAN_COMMENT BOOLEAN := FALSE;
    BEGIN

        IF TRIM(P_COMMENT_TEXT) IS NULL THEN
            RAISE_APPLICATION_ERROR(-20018, 'Comment text is required');
        END IF;

        IF LENGTHB(TRIM(P_COMMENT_TEXT)) > 1000 THEN
            RAISE_APPLICATION_ERROR(-20021, 'Comment must not exceed 1000 bytes');
        END IF;

        BEGIN

            SELECT ID, ROLE
            INTO V_USER_ID, V_ROLE
            FROM TS_USERS
            WHERE LOWER(email) = LOWER(V('APP_USER'));

            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    RAISE_APPLICATION_ERROR(-20003, 'User account not found');

        END;

        BEGIN

            SELECT SUBMITTED_BY, ASSIGNED_TO, STATUS
            INTO V_SUBMITTED_BY, V_ASSIGNED_TO, V_STATUS
            FROM TS_TICKETS
            WHERE ID = P_TICKET_ID
            FOR UPDATE;

            IF V_STATUS IN ('Closed', 'Cancelled') THEN
                RAISE_APPLICATION_ERROR(-20019, 'Comments cannot be added to closed or cancelled tickets');
            END IF;

            EXCEPTION
                    WHEN NO_DATA_FOUND THEN
                        RAISE_APPLICATION_ERROR(-20006, 'Ticket not found');

        END;
    
        IF V_USER_ID = V_SUBMITTED_BY
            OR (V_ROLE = 'Support' AND V_USER_ID = V_ASSIGNED_TO)
            OR V_ROLE = 'Admin' THEN
                V_CAN_COMMENT := TRUE;
        END IF;

        IF NOT V_CAN_COMMENT THEN
            RAISE_APPLICATION_ERROR(-20020,'Not authorised to comment on this ticket');
        END IF;

        INSERT INTO TS_TICKET_COMMENTS (
            COMMENT_TEXT,
            TICKET_ID,
            USER_ID
        ) VALUES (
            TRIM(P_COMMENT_TEXT),
            P_TICKET_ID,
            V_USER_ID
        );

    END add_comment;

END ts_pkg;
/