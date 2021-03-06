{% macro get_session_id_path_sql(relation_alias) %}

  {{ return(adapter.dispatch('get_session_id_path_sql', 'snowplow_mobile')(relation_alias)) }}

{% endmacro %}

{% macro default__get_session_id_path_sql(relation_alias) %}
  {% set session_id %}
    {{ relation_alias }}.contexts_com_snowplowanalytics_snowplow_client_session_1[0]:sessionId::VARCHAR(36)
  {% endset %}

  {{ return(session_id) }}

{% endmacro %}

{% macro bigquery__get_session_id_path_sql(relation_alias) %}
  {%- set session_id = snowplow_utils.combine_column_versions(
                                  relation=source('atomic','events'),
                                  column_prefix='contexts_com_snowplowanalytics_snowplow_client_session_1_',
                                  required_fields=['session_id'],
                                  relation_alias=relation_alias,
                                  include_field_alias=false
                                  )|join('') -%}
  
  
  {{ return(session_id) }}

{% endmacro %}

{% macro get_device_user_id_path_sql(relation_alias) %}

  {{ return(adapter.dispatch('get_device_user_id_path_sql', 'snowplow_mobile')(relation_alias)) }}

{% endmacro %}

{% macro default__get_device_user_id_path_sql(relation_alias) %}

  {% set user_id %}
    {{ relation_alias }}.contexts_com_snowplowanalytics_snowplow_client_session_1[0]:userId::VARCHAR(36)
  {% endset %}

  {{ return(user_id) }}

{% endmacro %}

{% macro bigquery__get_device_user_id_path_sql(relation_alias) %}

  {%- set user_id = snowplow_utils.combine_column_versions(
                                  relation=source('atomic','events'),
                                  column_prefix='contexts_com_snowplowanalytics_snowplow_client_session_1_',
                                  required_fields=['user_id'],
                                  relation_alias=relation_alias,
                                  include_field_alias=false
                                  )|join('') -%}

  {{ return(user_id) }}

{% endmacro %}
