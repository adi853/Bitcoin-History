-- CREATING DATABASE AND IMPORT TABLE SESSION --
CREATE DATABASE BITCOIN_HISTORY;
USE BITCOIN_HISTORY;
CREATE TABLE btc_history (
    `Date` DATE,
    `Close` DECIMAL(18 , 4 ),
    `High` DECIMAL(18 , 4 ),
    `Low` DECIMAL(18 , 4 ),
    `Open` DECIMAL(18 , 4 ),
    `Volume` BIGINT
);
DROP TABLE IF EXISTS btc_history;

CREATE TABLE btc_history (
    Date VARCHAR(50),
    Open TEXT,
    High TEXT,
    Low TEXT,
    Close TEXT,
    Volume TEXT
);

-- 1. YEAR WISE HIGH RATIO --
 SELECT 
    RIGHT(`Date`, 4) AS Yearr,
    MAX(`High`) AS Yearly_high,
    Round(AVG(`Close`),2) AS Yearly_Avg,
    ROUND(MAX(`High`) / AVG(`Close`), 2) AS High_to_avg_ratio
FROM
    btc_history
WHERE
    `DATE` IS NOT NULL
GROUP BY Yearr
ORDER BY Yearr;

-- 2.YEAR WISE LOW RATIO --
SELECT 
    RIGHT(`Date`, 4) AS Yearr,
    MIN(`Low`) AS yearly_min_low,
    ROUND(AVG(Low), 2) AS average_low,
    CONCAT(ROUND(MIN(`Low`) / AVG(`Low`)*100,2),'%') AS low_avg_ratio
FROM
    btc_history
WHERE
    `Date` IS NOT NULL
GROUP BY Yearr
ORDER BY Yearr ASC;

-- 3.YEAR WISE MOST LOW & HIGH VALUE AND Ratio --
SELECT 
    RIGHT(`Date`, 4) AS yearr,
    MAX(`High`) AS highest_value,
    ROUND(AVG(`High`), 2) AS average_of_high_value,
    CONCAT(ROUND((MAX(`High`) / AVG(`High`)) * 100, 2),
            '%') AS high_percentage,
    MIN(`Low`) AS Most_low_value,
    ROUND(AVG(`Low`), 2) AS average_of_low_value,
    CONCAT(ROUND((MIN(`Low`) / AVG(`Low`)) * 100, 2),
            '%') AS low_percentage
FROM
    btc_history
WHERE
    `Date` IS NOT NULL
GROUP BY yearr
ORDER BY yearr ASC;

-- 4.PRICE VOLATILITY ANALYSIS --
SELECT 
    RIGHT(`Date`, 4) AS yearr,
    MAX(`High`) AS yearly_high,
    MIN(`Low`) AS yearly_low,
    ROUND(MAX(`High`) - MIN(`Low`), 2) AS price_spread,
    CONCAT(ROUND(((MAX(`High`) - MIN(`Low`)) / MIN(`Low`)) * 100,
                    2),
            '%') AS volatility_percentage
FROM
    btc_history
GROUP BY yearr
ORDER BY yearr ASC;

-- 5.MOM (month over month ) growth  --
select 
right(`Date`,4) as yearr,
substring(`date`,4,2) as monthh,
round(avg(`Close`),2) as average_close_price,
Lag(round(avg(`Close`),2)) over(order by right(`Date`,4),substring(`date`,4,2)) as previous_month_price,
concat(round(((avg(`Close`)- lag(avg(`Close`)) over(order by right(`Date`,4),substring(`date`,4,2)))/Lag(round(avg(`Close`),2)) over(order by right(`Date`,4),substring(`date`,4,2)))*100,2),'%') as MoM_percentage
from btc_history
WHERE`Date` is not null
group by yearr,monthh
order by yearr,monthh;

-- 6.CONSECUTIVE DAYS OF GAIN & LOSS --
SELECT 
RIGHT(`DATE`,4) as yearr,`Close`,
substring(`Date`,4,2) as monthh,
lag(`Close`) over( order by RIGHT(`DATE`,4),substring(`Date`,4,2),left(`Date`,2)) as prev_close,
Case when `Close`>lag(`Close`) over( order by RIGHT(`DATE`,4),substring(`Date`,4,2),left(`Date`,2)) then "Gain"
when `Close`<lag(`Close`) over( order by RIGHT(`DATE`,4),substring(`Date`,4,2),left(`Date`,2)) then"Loss"
else "no change"
end as day_status
from btc_history
where `Date` is not null;