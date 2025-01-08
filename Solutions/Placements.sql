WITH one AS (
    SELECT 
        s.id AS sid, 
        s.name AS name, 
        p.salary AS s1, 
        friends.id AS fid 
    FROM 
        Students AS s 
    INNER JOIN 
        packages AS p 
    ON 
        p.id = s.id 
    INNER JOIN 
        friends 
    ON 
        friends.friend_id = p.id
)
SELECT 
    o1.name 
FROM 
    one AS o1 
INNER JOIN 
    one AS o2 
ON 
    o1.sid = o2.fid 
WHERE 
    o1.s1 < o2.s1 
ORDER BY 
    o2.s1;