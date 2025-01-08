WITH one AS (
    SELECT 
        h.hacker_id, 
        h.name, 
        COUNT(*) AS c 
    FROM 
        hackers AS h 
    INNER JOIN 
        challenges AS c 
    ON 
        h.hacker_id = c.hacker_id 
    GROUP BY 
        h.hacker_id, h.name
),
two AS (
    SELECT 
        c, 
        COUNT(*) AS c2 
    FROM 
        one 
    GROUP BY 
        c
)
SELECT 
    one.hacker_id, 
    one.name, 
    one.c 
FROM 
    one 
INNER JOIN 
    two 
ON 
    one.c = two.c 
WHERE 
    one.c = (SELECT MAX(c) FROM one) 
    OR two.c2 = 1 
ORDER BY 
    one.c DESC, 
    one.hacker_id;