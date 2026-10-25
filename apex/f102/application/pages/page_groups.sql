prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 102
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>9210439005001343
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'WKSP_MYAPPWS'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(23010094963080286)
,p_group_name=>'Administration'
,p_static_id=>'administration'
);
wwv_flow_imp.component_end;
end;
/
