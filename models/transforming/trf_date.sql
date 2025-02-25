{{config (materialized ='table', schema = env_var('DBT_TRANSFORMSCHEMA', 'TRANSFORMING_DEV'))}}

{% set min_orderdate = get_min_orderdate() %}
{% set max_orderdate = get_max_orderdate() %}

{{ dbt_date.get_date_dimension(min_orderdate,max_orderdate) }}