
-- Portfolio Analysis Project

-- Time Series Analysis
-- This query calculates the average price of each asset (AMZN, DPZ, BTC, NFLX) per year.
SELECT 
    strftime('%Y', Date) AS Year, 
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
-- This query compares the initial and final prices to determine the growth rate for each asset.
SELECT 
    (SELECT AMZN FROM portfolio ORDER BY Date LIMIT 1) AS Initial_AMZN,
    (SELECT AMZN FROM portfolio ORDER BY Date DESC LIMIT 1) AS Final_AMZN,
    (SELECT DPZ FROM portfolio ORDER BY Date LIMIT 1) AS Initial_DPZ,
    (SELECT DPZ FROM portfolio ORDER BY Date DESC LIMIT 1) AS Final_DPZ,
    (SELECT BTC FROM portfolio ORDER BY Date LIMIT 1) AS Initial_BTC,
    (SELECT BTC FROM portfolio ORDER BY Date DESC LIMIT 1) AS Final_BTC,
    (SELECT NFLX FROM portfolio ORDER BY Date LIMIT 1) AS Initial_NFLX,
    (SELECT NFLX FROM portfolio ORDER BY Date DESC LIMIT 1) AS Final_NFLX
FROM portfolio
LIMIT 1;

-- Note: Correlation Analysis is not included due to SQLite limitations.
