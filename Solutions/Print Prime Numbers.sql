WITH Numbers AS (
    SELECT 2 AS num
    UNION ALL
    SELECT num + 1 FROM Numbers WHERE num < 1000
),
Primes AS (
    SELECT a.num
    FROM Numbers a
    WHERE NOT EXISTS (
        SELECT 1
        FROM Numbers b
        WHERE b.num <= SQRT(a.num)
          AND a.num % b.num = 0
    )
)
SELECT 
    STRING_AGG(num, '&') AS primes
FROM 
    Primes
OPTION (MAXRECURSION 0);