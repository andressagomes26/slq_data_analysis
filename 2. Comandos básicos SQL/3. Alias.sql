--- Alias - AS
SELECT id AS id_cliente, first_name AS primeiro_nome
FROM ecommerce.customers;

SELECT id, total_price
FROM ecommerce.items AS i;

-- AS + JOIN
SELECT p.name, c.name
FROM
  ecommerce.products AS p JOIN ecommerce.categories AS c
  ON p.category_id = c.id;