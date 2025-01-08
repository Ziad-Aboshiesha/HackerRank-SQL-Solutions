WITH one AS (
    SELECT 
        w.id, 
        p.age, 
        w.coins_needed, 
        w.power, 
        ROW_NUMBER() OVER (PARTITION BY p.age, w.power ORDER BY w.coins_needed) AS rn 
    FROM 
        wands AS w 
    INNER JOIN 
        wands_property AS p 
    ON 
        w.code = p.code 
    WHERE 
        p.is_evil = 0
)
SELECT 
    one.id, 
    one.age, 
    one.coins_needed, 
    one.power 
FROM 
    one 
WHERE 
    rn = 1 
ORDER BY 
    one.power DESC, 
    one.age DESC;