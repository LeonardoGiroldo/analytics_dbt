{% set meses = ("JAN", "FEB", "MAR") %}
{% set ano = 2008 %}

with source_data as(
    select
        dateid as id_date,
        month as mes,
        year as ano
    from date
),

sales_date as(
    select
        source_data.mes,
        sum(QUANTIDADE_VENDIDA)
    from {{ ref('vw_sales') }} as sales
    inner join source_data
    on sales.id_date = source_data.id_date
    where source_data.mes in {{meses}}
    and source_data.ano = '{{ano}}'
    group by source_data.mes
)

select * from sales_date