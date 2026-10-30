
-- Q1.5.1 : Tous les produits
SELECT * FROM produits;

-- Q1.5.2 : Produits en rupture de stock
SELECT * FROM produits
WHERE quantite = 0;

-- Q1.5.3 : Produits du plus cher au moins cher
SELECT * FROM produits
ORDER BY prix DESC;

-- Q1.5.4 : Produits avec leurs catégories
SELECT p.nom, c.nom
FROM produits p
INNER JOIN categories c
ON p.categorie_id = c.id;

-- Q1.5.5 : Nombre de produits par catégorie
SELECT c.nom, COUNT(p.id)
FROM categories c
LEFT JOIN produits p
ON c.id = p.categorie_id
GROUP BY c.id, c.nom;

-- Q1.5.6 : Valeur totale du stock
SELECT SUM(prix * quantite) AS valeur_totale_stock
FROM produits;
