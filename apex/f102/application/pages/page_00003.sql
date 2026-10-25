prompt --application/pages/page_00003
begin
--   Manifest
--     PAGE: 00003
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
 p_id=>3
,p_name=>'Submit Ticket'
,p_alias=>'SUBMIT-TICKET'
,p_step_title=>'Support Desk | Submit Ticket'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#sd-submit-ticket {',
'    max-width: 960px;',
'    margin-inline: auto;',
'}'))
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(27312159123589575)
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
 p_id=>wwv_flow_imp.id(27312925859589656)
,p_plug_name=>'Describe your issue'
,p_static_id=>'sd-submit-ticket'
,p_region_name=>'sd-submit-ticket'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'TS_TICKETS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(27320913124589696)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(27312925859589656)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&APP_SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(27322110190589702)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(27312925859589656)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit Ticket'
,p_button_position=>'CREATE'
,p_button_condition=>'P3_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(27322536657589703)
,p_branch_action=>'f?p=&APP_ID.:2:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27316468430589681)
,p_name=>'P3_ASSIGNED_TO'
,p_source_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(27312925859589656)
,p_item_source_plug_id=>wwv_flow_imp.id(27312925859589656)
,p_source=>'ASSIGNED_TO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27316859477589683)
,p_name=>'P3_CATEGORY_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(27312925859589656)
,p_item_source_plug_id=>wwv_flow_imp.id(27312925859589656)
,p_prompt=>'Category'
,p_source=>'CATEGORY_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT name as d, id as r',
'FROM TS_CATEGORIES;',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Select Category --'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27315280783589675)
,p_name=>'P3_CREATED_AT'
,p_source_data_type=>'DATE'
,p_is_query_only=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(27312925859589656)
,p_item_source_plug_id=>wwv_flow_imp.id(27312925859589656)
,p_source=>'CREATED_AT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27314001620589668)
,p_name=>'P3_DESCRIPTION'
,p_data_type=>'CLOB'
,p_source_data_type=>'CLOB'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(27312925859589656)
,p_item_source_plug_id=>wwv_flow_imp.id(27312925859589656)
,p_prompt=>'Description'
,p_source=>'DESCRIPTION'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27313252226589658)
,p_name=>'P3_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(27312925859589656)
,p_item_source_plug_id=>wwv_flow_imp.id(27312925859589656)
,p_source=>'ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27314491829589673)
,p_name=>'P3_PRIORITY'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(27312925859589656)
,p_item_source_plug_id=>wwv_flow_imp.id(27312925859589656)
,p_item_default=>'Medium'
,p_prompt=>'Priority'
,p_source=>'PRIORITY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Low;Low,Medium;Medium,High;High,Critical;Critical'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Select Priority --'
,p_cHeight=>1
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27317201388589684)
,p_name=>'P3_RESOLUTION_NOTES'
,p_source_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(27312925859589656)
,p_item_source_plug_id=>wwv_flow_imp.id(27312925859589656)
,p_source=>'RESOLUTION_NOTES'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27315672029589677)
,p_name=>'P3_RESOLVED_AT'
,p_source_data_type=>'DATE'
,p_is_query_only=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(27312925859589656)
,p_item_source_plug_id=>wwv_flow_imp.id(27312925859589656)
,p_source=>'RESOLVED_AT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27314855587589674)
,p_name=>'P3_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(27312925859589656)
,p_item_source_plug_id=>wwv_flow_imp.id(27312925859589656)
,p_source=>'STATUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27316046762589678)
,p_name=>'P3_SUBMITTED_BY'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(27312925859589656)
,p_item_source_plug_id=>wwv_flow_imp.id(27312925859589656)
,p_source=>'SUBMITTED_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27313696823589666)
,p_name=>'P3_TITLE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(27312925859589656)
,p_item_source_plug_id=>wwv_flow_imp.id(27312925859589656)
,p_prompt=>'Title'
,p_source=>'TITLE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>150
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(27322992381589705)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(27312925859589656)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Submit Ticket'
,p_static_id=>'initialize-form-submit-ticket'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'current_row_total_item', '',
  'next_primary_key_items', '',
  'previous_primary_key_items', '')).to_clob
,p_internal_uid=>27322992381589705
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(25713704305082209)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Populate Submitted By'
,p_static_id=>'populate-submitted-by'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    :P3_SUBMITTED_BY := TS_PKG.POPULATE_SUBMITTED_BY(:APP_USER);',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(27322110190589702)
,p_internal_uid=>25713704305082209
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(27323379881589708)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(27312925859589656)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Submit Ticket'
,p_static_id=>'process-form-submit-ticket'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(27322110190589702)
,p_internal_uid=>27323379881589708
);
wwv_flow_imp.component_end;
end;
/
