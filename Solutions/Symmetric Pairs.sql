WITH one AS (
    SELECT 
        x, 
        y, 
        COUNT(*) AS cnt 
    FROM 
        functions 
    GROUP BY 
        x, y 
    HAVING 
        COUNT(*) > 1
    UNION
    SELECT 
        x, 
        y, 
        COUNT(*) AS cnt 
    FROM 
        functions 
    WHERE 
        x <> y 
    GROUP BY 
        x, y
),
two AS (
    SELECT 
        x, 
        y 
    FROM 
        one
)
SELECT 
    t3.x, 
    t3.y 
FROM 
    two AS t3 
INNER JOIN 
    two AS t4 
ON 
    t3.y = t4.x 
WHERE 
    t3.x IN (SELECT t1.x FROM two AS t1 INNER JOIN two AS t2 ON t1.x = t2.y)
    AND t3.x <= t3.y 
ORDER BY 
    t3.x;