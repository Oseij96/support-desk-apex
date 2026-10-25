create or replace FUNCTION AUTHENTICATE_USER(
    p_username VARCHAR2,
    p_password VARCHAR2
) RETURN BOOLEAN
IS
    v_hash ts_users.password_hash%TYPE;
BEGIN
    
    SELECT password_hash
    INTO v_hash
    FROM TS_USERS
    WHERE LOWER(email) = LOWER(p_username);

    IF v_hash = HASH_PASSWORD(p_password) THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN FALSE;

END;
/