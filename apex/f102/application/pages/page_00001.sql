prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>9210439005001343
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'WKSP_MYAPPWS'
);
wwv_flow_imp_page.create_page(
 p_id=>1
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'Support Desk | Dashboard'
,p_error_handling_function=>'TS_DASHBOARD_ERROR'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'@media (max-width: 640px) {',
'    #sd-quick-actions .t-Button {',
'        display: block;',
'        width: 100%;',
'        margin: 0 0 8px;',
'    }',
'}'))
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'13'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(31117053777712522)
,p_name=>'GitHub Service Status'
,p_static_id=>'github-service-status'
,p_template=>4073835273271169698
,p_display_sequence=>50
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_location=>'WEB_SOURCE'
,p_web_src_module_id=>wwv_flow_imp.id(32916413833476633)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID,',
'       NAME,',
'       GROUP_,',
'       INITCAP(REPLACE(STATUS, ''_'', '' '')) AS STATUS,',
'       PAGE_ID,',
'       GROUP_ID,',
'       POSITION,',
'       SHOWCASE,',
'       CREATED_AT,',
'       START_DATE,',
'       UPDATED_AT,',
'       DESCRIPTION,',
'       ONLY_SHOW_IF_DEGRADED',
'from #APEX$SOURCE_DATA#',
'where SHOWCASE = TRUE',
'order by POSITION'))
,p_source_post_processing=>'SQL'
,p_required_role=>wwv_flow_imp.id(26311893143120274)
,p_ajax_enabled=>'Y'
,p_lazy_loading=>true
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No service-status data was returned. Check GitHub Status for the latest information.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(31117952925712531)
,p_query_column_id=>9
,p_column_alias=>'CREATED_AT'
,p_column_display_sequence=>90
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(31118295289712534)
,p_query_column_id=>12
,p_column_alias=>'DESCRIPTION'
,p_column_display_sequence=>120
,p_column_heading=>'Description'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(31117301975712525)
,p_query_column_id=>3
,p_column_alias=>'GROUP_'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(31117660265712528)
,p_query_column_id=>6
,p_column_alias=>'GROUP_ID'
,p_column_display_sequence=>60
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(31117196133712523)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(31117203894712524)
,p_query_column_id=>2
,p_column_alias=>'NAME'
,p_column_display_sequence=>20
,p_column_heading=>'Service'
,p_use_as_row_header=>'Y'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(31118336624712535)
,p_query_column_id=>13
,p_column_alias=>'ONLY_SHOW_IF_DEGRADED'
,p_column_display_sequence=>130
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(31117539421712527)
,p_query_column_id=>5
,p_column_alias=>'PAGE_ID'
,p_column_display_sequence=>50
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(31117700933712529)
,p_query_column_id=>7
,p_column_alias=>'POSITION'
,p_column_display_sequence=>70
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(31117887360712530)
,p_query_column_id=>8
,p_column_alias=>'SHOWCASE'
,p_column_display_sequence=>80
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(31118022724712532)
,p_query_column_id=>10
,p_column_alias=>'START_DATE'
,p_column_display_sequence=>100
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(31117486095712526)
,p_query_column_id=>4
,p_column_alias=>'STATUS'
,p_column_display_sequence=>40
,p_column_heading=>'Status'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(31118109075712533)
,p_query_column_id=>11
,p_column_alias=>'UPDATED_AT'
,p_column_display_sequence=>110
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(23017534336080348)
,p_plug_name=>'Support Desk'
,p_static_id=>'it-support-ticket-system'
,p_title=>'Support Desk'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2675494171183407654
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'Submit IT issues, track your tickets, and keep support moving.'
,p_plug_query_num_rows=>15
,p_region_image=>'#APP_FILES#icons/app-icon-512.png'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(31116355157712515)
,p_name=>'My Assigned Tickets'
,p_static_id=>'my-assigned-tickets'
,p_template=>4073835273271169698
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-BadgeList--large:t-BadgeList--fixed:t-BadgeList--circular'
,p_new_grid_row=>false
,p_grid_column_span=>4
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT COUNT(t.id) assigned_tickets',
'FROM ts_tickets t',
'JOIN ts_users u',
'    ON LOWER(u.email) = LOWER(:APP_USER)',
'WHERE t.status NOT IN(''Resolved'', ''Closed'', ''Cancelled'')',
'AND u.role IN(''Admin'', ''Support'')',
'AND t.assigned_to = u.id;'))
,p_required_role=>wwv_flow_imp.id(26311893143120274)
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2106120299521025145
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(31116590103712517)
,p_query_column_id=>1
,p_column_alias=>'ASSIGNED_TICKETS'
,p_column_display_sequence=>10
,p_column_heading=>'Assigned Tickets'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(31116116892712513)
,p_name=>'My Open Tickets'
,p_static_id=>'my-open-tickets'
,p_template=>4073835273271169698
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-BadgeList--large:t-BadgeList--fixed:t-BadgeList--circular'
,p_grid_column_span=>4
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT COUNT(t.id) open_tickets',
'FROM ts_tickets t',
'JOIN ts_users u',
'    ON LOWER(u.email) = LOWER(:APP_USER)',
'WHERE t.status NOT IN(''Resolved'', ''Closed'', ''Cancelled'')',
'AND t.submitted_by = u.id;'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2106120299521025145
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(31116261556712514)
,p_query_column_id=>1
,p_column_alias=>'OPEN_TICKETS'
,p_column_display_sequence=>10
,p_column_heading=>'Open Tickets'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(31115782477712509)
,p_plug_name=>'Quick Actions'
,p_static_id=>'quick-actions'
,p_title=>'Quick Actions'
,p_region_name=>'sd-quick-actions'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(31116693379712518)
,p_name=>'Tickets Awaiting Claim'
,p_static_id=>'tickets-awaitng-claim'
,p_template=>4073835273271169698
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-BadgeList--large:t-BadgeList--fixed:t-BadgeList--circular'
,p_new_grid_row=>false
,p_grid_column_span=>4
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT COUNT(t.id) tickets_awaiting_claim',
'FROM ts_tickets t',
'WHERE t.status IN(''Reopened'', ''Unassigned'')',
'AND t.assigned_to IS NULL;'))
,p_required_role=>wwv_flow_imp.id(26311893143120274)
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2106120299521025145
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(31116743497712519)
,p_query_column_id=>1
,p_column_alias=>'TICKETS_AWAITING_CLAIM'
,p_column_display_sequence=>10
,p_column_heading=>'Tickets Awaiting Claim'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(31115963977712511)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(31115782477712509)
,p_button_name=>'My_Tickets'
,p_static_id=>'my-tickets'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--padBottom'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'My Tickets'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:2::'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(31115800394712510)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(31115782477712509)
,p_button_name=>'Submit_Ticket'
,p_static_id=>'submit-ticket'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--padBottom'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit Ticket'
,p_button_redirect_url=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:3::'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(31116099024712512)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(31115782477712509)
,p_button_name=>'Support_Ticket_Queue'
,p_static_id=>'support-ticket-queue'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--padBottom'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Support Ticket Queue'
,p_button_redirect_url=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:4::'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
,p_security_scheme=>wwv_flow_imp.id(26311893143120274)
);
wwv_flow_imp.component_end;
end;
/
