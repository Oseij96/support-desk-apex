create or replace FUNCTION TS_DASHBOARD_ERROR(
    p_error IN apex_error.t_error
) RETURN apex_error.t_error_result
IS
    l_result apex_error.t_error_result;
BEGIN
    l_result := apex_error.init_error_result(p_error);

    IF p_error.message LIKE '%REST Data Source returned an HTTP error:%' THEN
        l_result.message := 'GitHub service status is temporarily unavailable. Please try again later.';
        l_result.additional_info := NULL;
    END IF;

    RETURN l_result;
END;
/