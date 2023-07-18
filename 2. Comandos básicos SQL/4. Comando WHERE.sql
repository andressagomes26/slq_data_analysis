-- Where
SELECT *
FROM ecommerce.items
WHERE quantity = 1;

SELECT *
FROM ecommerce.customers
WHERE (email IS NOT NULL) AND (state = 'Bahia');

SELECT *
FROM ecommerce.customers
WHERE (email IS NOT NULL) AND (state = 'Bahia' OR state = 'Rio Grande do Sul');

SELECT *
FROM ecommerce.customers
WHERE (email IS NOT NULL) AND (state = 'Bahia' OR state LIKE 'Rio%');