prompt --workspace/remote_servers/www_githubstatus_com_api_v2
begin
--   Manifest
--     REMOTE SERVER: www-githubstatus-com-api-v2
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>9210439005001343
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'WKSP_MYAPPWS'
);
wwv_imp_workspace.create_remote_server(
 p_id=>32912079688476594
,p_name=>'www-githubstatus-com-api-v2'
,p_static_id=>'www-githubstatus-com-api-v2'
,p_base_url=>nvl(wwv_flow_application_install.get_remote_server_base_url('www-githubstatus-com-api-v2'),'https://www.githubstatus.com/api/v2/')
,p_https_host=>nvl(wwv_flow_application_install.get_remote_server_https_host('www-githubstatus-com-api-v2'),'')
,p_server_type=>'WEB_SERVICE'
,p_ords_timezone=>nvl(wwv_flow_application_install.get_remote_server_ords_tz('www-githubstatus-com-api-v2'),'')
,p_prompt_on_install=>false
);
wwv_flow_imp.component_end;
end;
/
