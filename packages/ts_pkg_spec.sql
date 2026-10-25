create or replace PACKAGE ts_pkg AS 

    PROCEDURE claim_ticket (
        P_TICKET_ID NUMBER
    );

    PROCEDURE update_ticket_status (
        P_TICKET_ID NUMBER,
        P_NEW_STATUS VARCHAR2,
        P_RESOLUTION_NOTES VARCHAR2
    );

    PROCEDURE close_ticket(
        P_TICKET_ID NUMBER
    );

    PROCEDURE start_ticket(
        P_TICKET_ID NUMBER
    );

    PROCEDURE resolve_ticket(
        P_TICKET_ID NUMBER,
        P_RESOLUTION_NOTES VARCHAR2
    );

    FUNCTION validate_title (
        P_TITLE VARCHAR2
    ) RETURN VARCHAR2;

    FUNCTION validate_description (
        P_DESCRIPTION CLOB
    ) RETURN VARCHAR2;

    FUNCTION validate_category (
        P_CATEGORY NUMBER
    ) RETURN VARCHAR2;

    FUNCTION validate_resolution_notes (
        P_STATUS VARCHAR2,
        P_RESOLUTION_NOTES VARCHAR2
    ) RETURN VARCHAR2;

    FUNCTION populate_submitted_by (
        P_USERNAME VARCHAR2
    ) RETURN NUMBER;

    PROCEDURE add_comment (
        P_TICKET_ID NUMBER,
        P_COMMENT_TEXT VARCHAR2
    );

END ts_pkg;
/