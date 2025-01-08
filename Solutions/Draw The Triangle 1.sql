DECLARE @rows INT = 21; 
WITH pattern AS (
    SELECT @rows AS row_num
    UNION ALL
    SELECT row_num - 1
    FROM pattern
    WHERE row_num > 1
)
SELECT 
    LEFT(REPLICATE('* ', row_num), LEN(REPLICATE('* ', row_num)) - 1) AS stars
FROM pattern
OPTION (MAXRECURSION 0);