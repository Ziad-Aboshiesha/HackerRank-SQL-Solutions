SELECT 
    FORMAT(ROUND(MAX(LAT_N) - MIN(LAT_N), 4) + ROUND(MAX(LONG_W) - MIN(LONG_W), 4), '0.####') 
FROM 
    STATION;