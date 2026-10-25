create or replace FUNCTION HASH_PASSWORD(
    p_password VARCHAR2
) RETURN VARCHAR2
IS
BEGIN
    RETURN APEX_UTIL.GET_HASH(
        APEX_T_VARCHAR2(p_password),
        FALSE
    );
END;
/