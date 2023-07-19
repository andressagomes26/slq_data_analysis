-- JOIN
SELECT *
FROM bigquery-public-data.thelook_ecommerce.orders;

SELECT *
FROM bigquery-public-data.thelook_ecommerce.order_items;

SELECT orders.order_id, orders.user_id, orders.num_of_item, 
  items.order_id, items.user_id, ROUND(SUM(sale_price), 2) AS receita
FROM bigquery-public-data.thelook_ecommerce.orders AS orders
JOIN bigquery-public-data.thelook_ecommerce.order_items AS items
  ON orders.order_id = items.order_id
GROUP BY 1, 2, 3, 4, 5
ORDER BY receita DESC;