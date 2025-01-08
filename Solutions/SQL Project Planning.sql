WITH one1 AS (
    SELECT 
        start_date, 
        ROW_NUMBER() OVER (ORDER BY start_date) AS rn1 
    FROM 
        projects 
    WHERE 
        start_date NOT IN (SELECT end_date FROM projects)
),
one2 AS (
    SELECT 
        end_date, 
        ROW_NUMBER() OVER (ORDER BY end_date) AS rn2 
    FROM 
        projects 
    WHERE 
        end_date NOT IN (SELECT start_date FROM projects)
)
SELECT 
    one1.start_date, 
    one2.end_date 
FROM 
    one1 
INNER JOIN 
    one2 
ON 
    one1.rn1 = one2.rn2 
ORDER BY 
    DATEDIFF(day, one1.start_date, one2.end_date), 
    one1.start_date;