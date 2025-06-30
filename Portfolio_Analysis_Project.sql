
-- Portfolio Analysis Project

-- Time Series Analysis
-- This query calculates the average price of each asset (AMZN, DPZ, BTC, NFLX) per year.
SELECT 
    substr(Date, length(Date) - 3, 4) AS Year,
    AVG(AMZN) AS Average_AMZN, 
    AVG(DPZ) AS Average_DPZ, 
    AVG(BTC) AS Average_BTC, 
    AVG(NFLX) AS Average_NFLX 
FROM portfolio 
GROUP BY Year
ORDER BY Year;

-- Volatility Analysis
-- This query calculates the variance for each asset as a proxy for volatility.
-- Variance is used here due to the lack of direct standard deviation calculation in SQLite.
SELECT 
    (SELECT SUM(POW(AMZN - (SELECT AVG(AMZN) FROM portfolio), 2)) / COUNT(*) FROM portfolio) AS Variance_AMZN, 
    (SELECT SUM(POW(DPZ - (SELECT AVG(DPZ) FROM portfolio), 2)) / COUNT(*) FROM portfolio) AS Variance_DPZ, 
    (SELECT SUM(POW(BTC - (SELECT AVG(BTC) FROM portfolio), 2)) / COUNT(*) FROM portfolio) AS Variance_BTC, 
    (SELECT SUM(POW(NFLX - (SELECT AVG(NFLX) FROM portfolio), 2)) / COUNT(*) FROM portfolio) AS Variance_NFLX 
FROM portfolio
LIMIT 1;

-- Growth Analysis
-- This query compares initial and final prices to determine the growth rate for each asset using a CTE and window functions
WITH PriceGrowthMarkers AS (
    SELECT 
        Date,
        AMZN,
        DPZ,
        BTC,
        NFLX,
        FIRST_VALUE(AMZN) OVER (ORDER BY Date) AS Initial_AMZN,    
        LAST_VALUE(AMZN) OVER (ORDER BY Date ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS Final_AMZN, 
        FIRST_VALUE(DPZ) OVER (ORDER BY Date) AS Initial_DPZ,     
        LAST_VALUE(DPZ) OVER (ORDER BY Date ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS Final_DPZ,   
        FIRST_VALUE(BTC) OVER (ORDER BY Date) AS Initial_BTC,      
        LAST_VALUE(BTC) OVER (ORDER BY Date ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS Final_BTC,   
        FIRST_VALUE(NFLX) OVER (ORDER BY Date) AS Initial_NFLX,    
        LAST_VALUE(NFLX) OVER (ORDER BY Date ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS Final_NFLX
    FROM portfolio
)
SELECT 
    Initial_AMZN,    
    Final_AMZN,      
    ((Final_AMZN - Initial_AMZN) / Initial_AMZN * 100) AS Growth_Rate_AMZN,
    
    Initial_DPZ,     
    Final_DPZ,       
    ((Final_DPZ - Initial_DPZ) / Initial_DPZ * 100) AS Growth_Rate_DPZ,    
    
    Initial_BTC,     
    Final_BTC,       
    ((Final_BTC - Initial_BTC) / Initial_BTC * 100) AS Growth_Rate_BTC,    
    
    Initial_NFLX,    
    Final_NFLX,      
    ((Final_NFLX - Initial_NFLX) / Initial_NFLX * 100) AS Growth_Rate_NFLX 
FROM PriceGrowthMarkers
LIMIT 1; 


