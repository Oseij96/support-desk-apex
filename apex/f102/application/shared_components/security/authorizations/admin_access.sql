prompt --application/shared_components/security/authorizations/admin_access
begin
--   Manifest
--     SECURITY SCHEME: Admin Access
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>9210439005001343
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'WKSP_MYAPPWS'
);
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(26312291235316413)
,p_name=>'Admin Access'
,p_static_id=>'admin-access'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '    V_ROLE ts_users.role%TYPE;',
    'BEGIN',
    '    SELECT ROLE',
    '    INTO V_ROLE',
    '    FROM TS_USERS',
    '    WHERE lower(email) = lower(:APP_USER);',
    '',
    '    IF V_ROLE = ''Admin'' THEN',
    '        RETURN TRUE;',
    '    ELSE',
    '        RETURN FALSE;',
    '    END IF;',
    '',
    '    EXCEPTION',
    '        WHEN NO_DATA_FOUND THEN',
    '            RETURN FALSE;',
    '    ',
    'END;')))).to_clob
,p_version_scn=>'SH256:2dt5D7rozjzfQV-Tpw_73XKAW1WtEbgFYUkd5CtBZ8s'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_imp.component_end;
end;
/
