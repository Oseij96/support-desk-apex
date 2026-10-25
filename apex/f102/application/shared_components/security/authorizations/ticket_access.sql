prompt --application/shared_components/security/authorizations/ticket_access
begin
--   Manifest
--     SECURITY SCHEME: Ticket Access
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
 p_id=>wwv_flow_imp.id(31311447303618055)
,p_name=>'Ticket Access'
,p_static_id=>'ticket-access'
,p_scheme_type=>'NATIVE_EXISTS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SELECT 1',
    'FROM ts_tickets t',
    'JOIN ts_users u',
    '    ON LOWER(u.email) = LOWER(:APP_USER)',
    'WHERE t.id = :P5_ID',
    'AND (u.id = t.submitted_by OR u.role IN (''Admin'', ''Support''))')))).to_clob
,p_version_scn=>'SH256:_lFUzbznJrNc84J-ICLAToJ4E5duD1W6vPUemLgvRN8'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_imp.component_end;
end;
/
