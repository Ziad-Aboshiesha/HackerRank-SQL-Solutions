SELECT 
    FORMAT(
        SQRT(
            SQUARE(MAX(LAT_N) - MIN(LAT_N)) + 
            SQUARE(MAX(LONG_W) - MIN(LONG_W))
        ), 
        '0.####'
    ) 
FROM 
    STATION;