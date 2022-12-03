
  
    

  create  table
    "dev"."public"."tb_10_compradores__dbt_tmp"
    
    
    
  as (
    with sales as (
    select
        *
    from "dev"."public"."vw_sales"
),

compradores as(
    SELECT
        (firstname ||' '|| lastname) as nome_completo,
        userid
    from users
),

top_10_compradores as (
    SELECT
        compradores.nome_completo as nome_completo,
        sum(sales.QUANTIDADE_VENDIDA) as vendas_totais,
        sales.COMISSAO as comissao
    from sales inner join compradores
    on sales.ID_COMPRADOR = compradores.userid
    group by compradores.userid, compradores.nome_completo, sales.comissao
    order by vendas_totais DESC
    limit 10
)

SELECT
    *
from top_10_compradores
  );
  