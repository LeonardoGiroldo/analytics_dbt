

  create view "dev"."public"."vw_sales__dbt_tmp" as (
    with source_sales as(
    select
         *
    from sales
),

renamed as(
    SELECT
        SALESID AS ID_VENDA,
        SELLERID AS ID_VENDEDOR,
        BUYERID AS ID_COMPRADOR,
        EVENTID AS ID_EVENTO,
        DATEID AS ID_DATE,
        QTYSOLD AS QUANTIDADE_VENDIDA,
        PRICEPAID AS VALOR_PAGO,
        COMMISSION AS COMISSAO,
        TO_CHAR(SALETIME, 'dd/mm/yyyy HH24:MI:SS') as DATA_HORA_VENDA,
        cast(saletime as date) as DATA_VENDA,
        TO_CHAR(SALETIME, 'HH24:MI:SS') as HORA_VENDA
    FROM source_sales
)

SELECT
    *
from renamed
  ) ;
