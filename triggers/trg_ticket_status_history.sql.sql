create or replace TRIGGER trg_ticket_status_history
AFTER UPDATE OF status ON ts_tickets
FOR EACH ROW
DECLARE
    v_user_id ts_users.id%TYPE;
BEGIN
    IF :OLD.STATUS != :NEW.STATUS THEN
        SELECT id
        INTO v_user_id
        FROM ts_users
        WHERE LOWER(email) = LOWER(V('APP_USER'));

        INSERT INTO ts_status_history (
            old_status,
            new_status,
            changed_by,
            ticket_id
        )
        VALUES (
            :OLD.STATUS,
            :NEW.STATUS,
            v_user_id,
            :NEW.id
        );

     END IF;
END;
/