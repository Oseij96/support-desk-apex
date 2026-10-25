prompt --application/pages/page_00002
begin
--   Manifest
--     PAGE: 00002
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
 p_id=>2
,p_name=>'My Tickets'
,p_alias=>'MY-TICKETS'
,p_step_title=>'Support Desk | My Tickets'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.sd-status {',
'    display: inline-block;',
'    padding: 4px 10px;',
'    border-radius: 999px;',
'    background: #e2e8f0;',
'    color: #172b4d;',
'    font-size: 12px;',
'    font-weight: 600;',
'    white-space: nowrap;',
'}',
'',
'.sd-status[data-status="Unassigned"] {',
'    background: #f1f5f9;',
'    color: #475569;',
'}',
'',
'.sd-status[data-status="Assigned"],',
'.sd-status[data-status="In Progress"] {',
'    background: #dbeafe;',
'    color: #1e40af;',
'}',
'',
'.sd-status[data-status="Pending"] {',
'    background: #fef3c7;',
'    color: #92400e;',
'}',
'',
'.sd-status[data-status="Resolved"] {',
'    background: #dcfce7;',
'    color: #166534;',
'}',
'',
'.sd-status[data-status="Reopened"] {',
'    background: #ede9fe;',
'    color: #5b21b6;',
'}',
'',
'.sd-status[data-status="Closed"],',
'.sd-status[data-status="Cancelled"] {',
'    background: #e2e8f0;',
'    color: #334155;',
'}',
'',
'.sd-priority {',
'    font-weight: 600;',
'    white-space: nowrap;',
'}',
'',
'.sd-priority[data-priority="Low"] {',
'    color: #475569;',
'}',
'',
'.sd-priority[data-priority="Medium"] {',
'    color: #1e40af;',
'}',
'',
'.sd-priority[data-priority="High"] {',
'    color: #9a3412;',
'}',
'',
'.sd-priority[data-priority="Critical"] {',
'    display: inline-block;',
'    padding: 4px 10px;',
'    border-radius: 6px;',
'    background: #fee2e2;',
'    color: #991b1b;',
'    font-weight: 700;',
'}'))
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(26914612323011445)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_menu_id=>wwv_flow_imp.id(23004536667080183)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(26915451564011612)
,p_plug_name=>'My Tickets'
,p_static_id=>'my-tickets'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT t.id, t.title, t.priority, t.status, t.created_at',
'FROM ts_tickets t',
'JOIN ts_users u',
'    ON u.id = t.submitted_by',
'WHERE LOWER(u.email) = LOWER(:APP_USER);'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(26915530508011612)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>26915530508011612
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(26918319192011651)
,p_db_column_name=>'CREATED_AT'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(26916742824011635)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Ticket ID'
,p_column_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:5:P5_ID:#ID#'
,p_column_linktext=>'#ID#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'Y'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(26917583902011647)
,p_db_column_name=>'PRIORITY'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Priority'
,p_column_html_expression=>'<span class="sd-priority" data-priority="#PRIORITY!ATTR#">#PRIORITY!HTML#</span>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(26917972044011649)
,p_db_column_name=>'STATUS'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Status'
,p_column_html_expression=>'<span class="sd-status" data-status="#STATUS!ATTR#">#STATUS!HTML#</span>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(26917123039011644)
,p_db_column_name=>'TITLE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Title'
,p_column_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:5:P5_ID:#ID#'
,p_column_linktext=>'#TITLE#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(26918754211014064)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID:TITLE:PRIORITY:STATUS:CREATED_AT'
,p_sort_column_1=>'CREATED_AT'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'ID'
,p_sort_direction_2=>'DESC'
);
wwv_flow_imp.component_end;
end;
/
