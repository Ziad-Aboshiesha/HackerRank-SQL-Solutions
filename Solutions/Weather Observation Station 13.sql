SELECT 
    FORMAT(ROUND(SUM(LAT_N), 4), '0.####') 
FROM 
    STATION 
WHERE 
    LAT_N > 38.788 
    AND LAT_N < 137.2345;