{{config(materialized = 'table', schema = env_var('DBT_TRANSFORMSCHEMA', 'TRANSFORMING_DEV'))}}

select 
GET(XMLGET(supplierinfo,'SupplierID'),'$') as Supplierid,
GET(XMLGET(supplierinfo,'CompanyName'),'$'):: varchar as CompanyName,
GET(XMLGET(supplierinfo,'ContactName'),'$'):: varchar as ContactName,
GET(XMLGET(supplierinfo,'Address'),'$'):: varchar as Address,
GET(XMLGET(supplierinfo,'City'),'$'):: varchar as City,
GET(XMLGET(supplierinfo,'PostalCode'),'$'):: varchar as PostalCode,
GET(XMLGET(supplierinfo,'Country'),'$'):: varchar as Country,
GET(XMLGET(supplierinfo,'Phone'),'$'):: varchar as Phone,
GET(XMLGET(supplierinfo,'Fax'),'$') :: varchar as Fax

from
{{ref('stg_suppliers')}}