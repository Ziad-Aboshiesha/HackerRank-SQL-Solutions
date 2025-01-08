WITH pattern AS (
    SELECT 20 AS row_num
    UNION ALL
    SELECT row_num - 1
    FROM pattern
    WHERE row_num > 1
)
SELECT 
    STRING_AGG('*', ' ') WITHIN GROUP (ORDER BY VALUE) AS stars
FROM pattern 
CROSS APPLY (SELECT TOP(row_num) '*' AS VALUE FROM master..spt_values) A
GROUP BY REPLICATE('*', ROW_NUM);