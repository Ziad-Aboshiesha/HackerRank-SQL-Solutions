WITH two AS (
    SELECT 
        s.lat_n, 
        ROW_NUMBER() OVER (ORDER BY lat_n) AS rn 
    FROM 
        station AS s
)
SELECT 
    FORMAT(ROUND(lat_n, 4), '0.####') 
FROM 
    two 
WHERE 
    rn = (SELECT AVG(rn) FROM two);