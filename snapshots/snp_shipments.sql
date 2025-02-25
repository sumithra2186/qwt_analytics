{%snapshot shipment_snapshot%}
{{
    config
    (
        target_database = 'QWT_ANALYTICS_DEV',
        target_schema ='SNOPSHOT_DEV',
         
        unique_key ="OrderID||'-'||Lineno",
        strategy ='timestamp',
        updated_at ='ShipmentDate'


    )
}}
select * from {{ref('stg_shipments')}}
{%endsnapshot%}