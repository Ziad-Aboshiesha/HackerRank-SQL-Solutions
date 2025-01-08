WITH one AS (
    SELECT DISTINCT 
        h.hacker_id, 
        h.name, 
        c.challenge_id, 
        c.score, 
        ROW_NUMBER() OVER (PARTITION BY h.hacker_id, c.challenge_id ORDER BY c.score DESC) AS rn 
    FROM 
        hackers AS h 
    INNER JOIN 
        submissions AS c 
    ON 
        h.hacker_id = c.hacker_id
)
SELECT 
    one.hacker_id, 
    one.name, 
    SUM(one.score) 
FROM 
    one 
WHERE 
    one.rn = 1 
GROUP BY 
    one.hacker_id, 
    one.name 
HAVING 
    SUM(one.score) > 0 
ORDER BY 
    SUM(one.score) DESC, 
    one.hacker_id;