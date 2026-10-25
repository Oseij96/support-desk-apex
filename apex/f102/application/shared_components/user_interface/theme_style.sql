prompt --application/shared_components/user_interface/theme_style
begin
--   Manifest
--     THEME STYLE: 42
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>9210439005001343
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'WKSP_MYAPPWS'
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(33322725382072364)
,p_theme_id=>42
,p_name=>'Support Desk'
,p_static_id=>'support-desk'
,p_is_public=>true
,p_is_accessible=>true
,p_theme_roller_input_file_urls=>'#THEME_FILES#less/theme/Vita.less'
,p_theme_roller_config=>'{"classes":[],"vars":{"@g_Accent-BG":"#0f766e","@g_Accent-OG":"#f3f6fa","@g_Header-BG":"#14263d","@g_Header-FG":"#ffffff","@g_Body-BG":"#f3f6fa","@g_Body-Text":"#172b4d","@g_Body-Title-BG":"#ffffff","@g_Body-Title-FG":"#172b4d","@g_Container-BorderRa'
||'dius":"8px","@g_Nav-BG":"#14263d","@g_Nav-FG":"#e2e8f0","@g_Nav-Active-BG":"#0f766e","@g_Nav-Active-FG":"#ffffff"},"customCSS":"","useCustomLess":"N"}'
,p_theme_roller_output_file_url=>'#THEME_DB_FILES#33322725382072364.css'
,p_theme_roller_read_only=>false
);
wwv_flow_imp.component_end;
end;
/
