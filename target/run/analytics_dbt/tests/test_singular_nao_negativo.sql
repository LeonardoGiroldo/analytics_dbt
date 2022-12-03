select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      --test for finding if there is any negative number in the "vendas_totais"

SELECT
    *
from tb_10_compradores
where vendas_totais < 0
      
    ) dbt_internal_test