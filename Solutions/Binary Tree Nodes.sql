WITH one AS (
    SELECT 
        n, 
        'Root' AS status 
    FROM 
        BST 
    WHERE 
        p IS NULL
    UNION 
    SELECT 
        b1.n, 
        'Inner' AS status 
    FROM 
        BST AS b1 
    INNER JOIN 
        BST AS b2 
    ON 
        b1.n = b2.p 
    WHERE 
        b1.p IS NOT NULL
    UNION 
    SELECT 
        b3.n, 
        'Leaf' 
    FROM 
        BST AS b3 
    WHERE 
        b3.n NOT IN (SELECT p FROM BST WHERE p IS NOT NULL)
)
SELECT 
    * 
FROM 
    one 
ORDER BY 
    n;