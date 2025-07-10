-- 1. Affichez la somme totale des stocks de livres.


SELECT SUM(stock) AS total_stock FROM book;

-- 2. Affichez pour chaque auteur le nombre de livres écrits.

SELECT 
    a.first_name || ' ' || a.last_name AS author_name,
    COUNT(b.book_id) AS nb_books
FROM author a
LEFT JOIN book b ON a.author_id = b.author_id
GROUP BY a.author_id;

-- 3. Affichez le titre du livre, nom complet de l’auteur, et nom du thème.
SELECT 
    book.title,
    author.first_name || ' ' || author.last_name AS author_name,
    theme.theme_name
FROM book
JOIN author ON book.author_id = author.author_id
JOIN theme ON book.theme_id = theme.theme_id;

-- 4. Affichez toutes les commandes d’un client donné avec titre du livre et date de commande.


SELECT 
    customer_order.order_id,
    customer.email,
    book.title,
    customer_order.order_date
FROM customer_order
JOIN book ON customer_order.book_id = book.book_id
JOIN customer ON customer_order.customer_id = customer.customer_id
WHERE customer_order.customer_id = 1;


-- 5. Affichez la moyenne des notes pour chaque livre ayant au moins 3 avis.
SELECT 
    book.title,
    AVG(review.rating) AS average_rating,
    COUNT(review.review_id) AS number_of_reviews
FROM book
JOIN review ON book.book_id = review.book_id
GROUP BY book.book_id
HAVING COUNT(review.review_id) >= 3;

-- 6. Affichez le nombre total de commandes passées par chaque client (email+nb commandes.

SELECT 
    customer.email,
    COUNT(customer_order.order_id) AS nb_orders
FROM customer
LEFT JOIN customer_order ON customer.customer_id = customer_order.customer_id
GROUP BY customer.customer_id;

-- 7. Affichez les titres des livres qui n’ont jamais été commandés.

--SELECT book.title, COUNT(customer_order.book_id) AS Total
--FROM book
--LEFT JOIN customer_order ON book.book_id = customer_order.book_id
--GROUP BY customer_order.order_id
HAVING COUNT(customer_order.book_id) = 0;


SELECT book.title
FROM book
LEFT JOIN customer_order ON book.book_id = customer_order.book_id
GROUP BY book.book_id
HAVING COUNT(customer_order.order_id) = 0;

SELECT COUNT(*) AS total_non_commandes
FROM book
LEFT JOIN customer_order ON book.book_id = customer_order.book_id
WHERE customer_order.book_id IS NULL;



-- 8. Affichez le chiffre d’affaires total généré par chaque auteur (somme des prix des livres commandés).
SELECT 
    author.first_name || ' ' || author.last_name AS author_name,
    SUM(customer_order.total_amount) AS revenue
FROM author
JOIN book ON author.author_id = book.author_id
JOIN customer_order ON book.book_id = customer_order.book_id
GROUP BY author.author_id;


