-- This file have SQL for needed Data

-- Table Name : online_shoppers

-- Table Col: 
-- Administrative
-- Administrative_Duration
-- Informational
-- Informational_Duration
-- ProductRelated
-- ProductRelated_Duration
-- BounceRates
-- ExitRates
-- PageValues
-- SpecialDay
-- Month
-- OperatingSystems
-- Browser
-- Region
-- TrafficType
-- VisitorType
-- Weekend
-- Revenue


-- Total Sessions & Purchase Sessions

SELECT COUNT(*) AS total_sessions,
    SUM(CASE WHEN Revenue = 'TRUE' THEN 1 ELSE 0 END) AS total_purchases
FROM online_shoppers;


-- Overall Conversion Rate (VERY IMPORTANT)

SELECT 
    ROUND(
        SUM(CASE WHEN Revenue='TRUE' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS conversion_rate_percent
FROM online_shoppers;


-- Returning vs New Visitor Conversion

SELECT
    VisitorType,
    COUNT(*) AS total_sessions,
    SUM(CASE WHEN Revenue='TRUE' THEN 1 ELSE 0 END) AS purchases,
    ROUND(SUM(CASE WHEN Revenue='TRUE' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS conversion_rate
FROM online_shoppers
GROUP BY VisitorType;


-- Weekend vs Weekday Conversion

SELECT
    Weekend,
    COUNT(*) AS total_sessions,
    SUM(CASE WHEN Revenue='TRUE' THEN 1 ELSE 0 END) AS purchases,
    ROUND(SUM(CASE WHEN Revenue='TRUE' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS conversion_rate
FROM online_shoppers
GROUP BY Weekend;

-- Monthly Purchase Trend

SELECT
    Month,
    COUNT(*) AS total_sessions,
    SUM(CASE WHEN Revenue='TRUE' THEN 1 ELSE 0 END) AS purchases
FROM online_shoppers
GROUP BY Month
ORDER BY purchases DESC;


-- Bounce Rate Comparison 

SELECT
    Revenue,
    ROUND(AVG(BounceRates),4) AS avg_bounce_rate
FROM online_shoppers
GROUP BY Revenue;


-- Exit Rate Comparison

SELECT
    Revenue,
    ROUND(AVG(ExitRates),4) AS avg_exit_rate
FROM online_shoppers
GROUP BY Revenue;


-- Engagement Analysis

SELECT
    Revenue,
    ROUND(AVG(ProductRelated_Duration),2) AS avg_product_time
FROM online_shoppers
GROUP BY Revenue;


-- Best Traffic Source

SELECT
    TrafficType,
    COUNT(*) AS sessions,
    SUM(CASE WHEN Revenue='TRUE' THEN 1 ELSE 0 END) AS purchases,
    ROUND(SUM(CASE WHEN Revenue='TRUE' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS conversion_rate
FROM online_shoppers
GROUP BY TrafficType
ORDER BY conversion_rate DESC;


-- Top Browsers Used by Buyers


SELECT
    Browser,
    COUNT(*) AS buyer_sessions
FROM online_shoppers
WHERE Revenue='TRUE'
GROUP BY Browser
ORDER BY buyer_sessions DESC;




