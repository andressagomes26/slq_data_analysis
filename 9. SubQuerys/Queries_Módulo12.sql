# SUBQUERY COMO COLUNA
SELECT
  u.id,
  u.name,
  (
    select
      count(c.id) as numero_compras
    from cursos-386113.relacionamentos.compras c
    where c.user_id = u.id
  ) as num_compras
FROM cursos-386113.relacionamentos.usuarios u;

select
  avg((
    select
      count(id)
    from cursos-386113.relacionamentos.acessos a
    where a.user_id = u.id
  )) as media_acessos
FROM cursos-386113.relacionamentos.usuarios u;

# SUBQUERY COMO TABELA
select
  avg(acessos) as media_acessos
from(
  select
    count(a.id) acessos,
    u.id
  from cursos-386113.relacionamentos.usuarios u  
  left join cursos-386113.relacionamentos.acessos a on u.id = a.user_id
  group by 2);

select
  user_id,
  avg(receita) as ticket_medio
from(
  select
    order_id,
    user_id,
    sum(sale_price) as receita
  from bigquery-public-data.thelook_ecommerce.order_items
  group by order_id, user_id
  )
group by 1;

# SUBQUERY COMO FILTRO
SELECT
  u.id,
  u.name,
  (
    select
      count(c.id) as numero_compras
    from cursos-386113.relacionamentos.compras c
    where c.user_id = u.id
  ) as num_compras
FROM cursos-386113.relacionamentos.usuarios u
where (
    select
      count(c.id) as numero_compras
    from cursos-386113.relacionamentos.compras c
    where c.user_id = u.id
  ) > 0;

SELECT
  u.id,
  u.name,
  (
    select
      count(c.id) as numero_compras
    from cursos-386113.relacionamentos.compras c
    where c.user_id = u.id
  ) as num_compras,
  acessos as num_acessos
FROM cursos-386113.relacionamentos.usuarios u
left join (
  select
    count(a.id) as acessos,
    user_id
  from cursos-386113.relacionamentos.acessos a
  group by 2
) as T on T.user_id = u.id
where (
    select
      count(c.id) as numero_compras
    from cursos-386113.relacionamentos.compras c
    where c.user_id = u.id
  ) > 0  and (
  select
    count(a.id) as acessos
  from cursos-386113.relacionamentos.acessos a
  where a.user_id = u.id
) > 0;

/*
1) Ache o dataset “thelook_ecommerce” nos dados públicos do BigQuery. Calcule a contagem distinta de sessões de tipo de evento = ‘cart’ e também de tipo de evento = ‘purchase’, para cada usuário cadastrado, como subqueries de coluna.
*/
select
  u.id,
  u.first_name,
  (
    select
      count(e.id)
    from bigquery-public-data.thelook_ecommerce.events e
    where e.user_id = u.id and event_type = 'cart'
  ) eventos_carrinho,
  (
    select
      count(e.id)
    from bigquery-public-data.thelook_ecommerce.events e
    where e.user_id = u.id and event_type = 'purchase'
  ) eventos_compra
from bigquery-public-data.thelook_ecommerce.users u;

/*
2) Na consulta da questão anterior, adicione uma subquery de tabela que calculará a quantidade de itens feitos por usuário e traga como coluna na query principal.
*/
select
  u.id,
  u.first_name,
  (
    select
      count(e.id)
    from bigquery-public-data.thelook_ecommerce.events e
    where e.user_id = u.id and event_type = 'cart'
  ) eventos_carrinho,
  (
    select
      count(e.id)
    from bigquery-public-data.thelook_ecommerce.events e
    where e.user_id = u.id and event_type = 'purchase'
  ) eventos_compra,
  num_itens
from bigquery-public-data.thelook_ecommerce.users u
left join (
  select
    user_id,
    count(id) as num_itens
  from bigquery-public-data.thelook_ecommerce.order_items
  group by 1
) as T on T.user_id = u.id
;


/*
3) Na consulta da questão anterior, adicione uma subquery de filtro que fará com que as sessões de tipo de evento = ‘cart’ sejam menores que a quantidade de itens feitos por usuário.
*/
select
  u.id,
  u.first_name,
  (
    select
      count(e.id)
    from bigquery-public-data.thelook_ecommerce.events e
    where e.user_id = u.id and event_type = 'cart'
  ) eventos_carrinho,
  (
    select
      count(e.id)
    from bigquery-public-data.thelook_ecommerce.events e
    where e.user_id = u.id and event_type = 'purchase'
  ) eventos_compra,
  num_itens
from bigquery-public-data.thelook_ecommerce.users u
left join (
  select
    user_id,
    count(id) as num_itens
  from bigquery-public-data.thelook_ecommerce.order_items
  group by 1
) as T on T.user_id = u.id
where (
    select
      count(e.id)
    from bigquery-public-data.thelook_ecommerce.events e
    where e.user_id = u.id and event_type = 'cart'
  ) < num_itens;

  select
  u.id,
  u.first_name,
  (
    select
      count(e.id)
    from bigquery-public-data.thelook_ecommerce.events e
    where e.user_id = u.id and event_type = 'cart'
  ) eventos_carrinho,
  (
    select
      count(e.id)
    from bigquery-public-data.thelook_ecommerce.events e
    where e.user_id = u.id and event_type = 'purchase'
  ) eventos_compra,
  num_itens
from bigquery-public-data.thelook_ecommerce.users u
left join (
  select
    user_id,
    count(id) as num_itens
  from bigquery-public-data.thelook_ecommerce.order_items
  group by 1
) as T on T.user_id = u.id
where (
    select
      count(e.id)
    from bigquery-public-data.thelook_ecommerce.events e
    where e.user_id = u.id and event_type = 'cart'
  ) > num_itens;
