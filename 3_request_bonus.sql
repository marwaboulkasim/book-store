-- Bonus SQL

-- 1. Trouver les 3 auteurs dont les livres ont généré le plus de chiffre d’affaires total.

SELECT 
    author.first_name || ' ' || author.last_name AS auteur,
    SUM(customer_order.total_amount) AS chiffre_affaires
FROM author
JOIN book ON author.author_id = book.author_id
JOIN customer_order ON book.book_id = customer_order.book_id
GROUP BY author.author_id
ORDER BY chiffre_affaires DESC
LIMIT 3;

-- 2. Calculer le total des ventes par thème de livre, classé du plus au moins vendu (en montant).
 SELECT 
    theme.theme_name AS theme,
    SUM(customer_order.total_amount) AS total_ventes
FROM theme
JOIN book ON theme.theme_id = book.theme_id
JOIN customer_order ON book.book_id = customer_order.book_id
GROUP BY theme.theme_id
ORDER BY total_ventes DESC;


-- 3. Afficher pour chaque mois de l’année 2024 le nombre de commandes passées et le chiffre d’affaires total.


-- 4. Pour chaque auteur, calculer la moyenne des notes des livres écrits, y compris les auteurs dont livres n’ont pas encore d’avis (afficher NULL dans ce cas).


-- 5. Afficher les commandes les plus récentes pour chaque client (1 commande max par client).
