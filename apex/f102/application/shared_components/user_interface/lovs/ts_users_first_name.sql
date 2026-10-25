prompt --application/shared_components/user_interface/lovs/ts_users_first_name
begin
--   Manifest
--     TS_USERS.FIRST_NAME
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>9210439005001343
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'WKSP_MYAPPWS'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(24607790488570808)
,p_lov_name=>'TS_USERS.FIRST_NAME'
,p_static_id=>'ts-users-first-name'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'TS_USERS'
,p_return_column_name=>'ID'
,p_display_column_name=>'FIRST_NAME'
,p_default_sort_column_name=>'FIRST_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'50155884102134'
);
wwv_flow_imp.component_end;
end;
/
