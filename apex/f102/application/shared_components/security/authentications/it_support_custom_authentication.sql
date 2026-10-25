prompt --application/shared_components/security/authentications/it_support_custom_authentication
begin
--   Manifest
--     AUTHENTICATION: IT Support Custom Authentication
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>9210439005001343
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'WKSP_MYAPPWS'
);
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(26514198631495369)
,p_name=>'IT Support Custom Authentication'
,p_static_id=>'authenticate-user'
,p_scheme_type=>'NATIVE_CUSTOM'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'authentication_function', 'AUTHENTICATE_USER',
  'enable_legacy_attributes', 'N')).to_clob
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_version_scn=>'SH256:BLsUIyBc7-t2wJ47dMbzUjpRfyXoySKhF6MAGRXZOik'
);
wwv_flow_imp.component_end;
end;
/
