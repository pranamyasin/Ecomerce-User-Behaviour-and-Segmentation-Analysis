CREATE database ecom_data;
use ecom_data;

# Ensuring Accurate Import of dataset !

SELECT * FROM ecom;
SELECT count(*) FROM ecom;

SELECT Customer_ID
FROM ecom
ORDER BY Customer_ID DESC
LIMIT 1; 

# Understanding dataset

desc ecom;
-- No null values are present 
-- All columns are accurately imported

SELECT customer_id, count(customer_id) as "repeated"
FROM ecom
GROUP BY customer_id
HAVING repeated>1;

-- Each customer id is unique and not repeated in the dataset


# Preprocessing dataset 

select * from ecom;

UPDATE ecom
SET Avg_Session_Duration = ROUND(Avg_Session_Duration,3)

UPDATE ecom
SET Cart_Abandon_Rate = ROUND(Cart_Abandon_Rate,3)

# Analysing the Dataset !

SELECT avg(Recency) as "Recency_by_segment", Segment_Label
FROM ecom
GROUP BY Segment_Label
Order BY Recency_by_segment desc;

-- Avg Recency of customers attaing Iron label is highest followed by Copper, Silver, Gold and least with Platinum

SELECT Avg(Cart_Abandon_Rate) as "Abandon_rate", Segment_Label
FROM ecom
GROUP BY Segment_Label
ORDER BY Abandon_rate Desc;

-- The sequence of segment label for Avg Cart abandon rate is same as Avg recency, Therefore, this could be the reason why 
-- customer who least visited are in Platinum segment since, their abandon rate is least

SELECT Avg(Returns) as "avg_returns", Segment_Label
FROM ecom
GROUP BY Segment_Label
ORDER BY avg_returns Desc;

-- The seq of avg returns is also same as recency, cart abadon rate contibuting to segmment label.

SELECT Avg(Frequency) as "avg_freq", Segment_Label
FROM ecom
GROUP BY Segment_Label
ORDER BY avg_freq Desc;

-- Avg Frequency of buying is highest by Platinum followed by Gold, Silver, Copper and least in Iron
-- Thus impact inversily to segment label
SELECT *
FROM ecom
ORDER BY Frequency DESC

SELECT *
FROM ecom
ORDER BY Frequency DESC
LIMIT 10;

-- All top 10 customers has frequency of 99 and are from platinum segment except 1 every customer has returned order at least once.

SELECT count(*) as "zero returns"
FROM ecom
WHERE Returns = 0;

-- 794 customers had no returns

Select *
FROM ecom
WHERE Monetary = (SELECT MAX(Monetary) FROM ecom);

-- Highest revenue of 9995 has been gained via CUST06954 with 63 frequent buy and 3 return and labeled as Platinum.

Select Avg(Avg_Order_Value) as "AOV", Segment_Label
FROM ecom
GROUP BY Segment_Label
ORDER BY AOV desc;

-- Avg order value of Platinum is highest followed by Gold, Silver, Copper and least in Iron

SELECT * FROM ecom;

SELECT *
FROM ecom
WHERE Avg_Session_Duration = (SELECT MAX(Avg_Session_Duration) FROM ecom);

-- Max avg  session is by CUST06717 having session count of 115 and is in segment platinum

SELECT count(*)
FROM ecom
WHERE Session_Count = (SELECT MAX(Session_Count) FROM ecom);

-- 12 customers has max session count of 199

SELECT DISTINCT(Campaign_Response), COUNT(Campaign_Response)as "Response_Type", SUM(Monetary) as "Total_Revenue"
FROM ecom
GROUP BY Campaign_Response;

-- Customers responded to the campaign provided total revenue of 12257568 while without response the revenue came to be 7126378
-- Therefore, about 63.23% of revenue came through campaign

SELECT * FROM ecom;

SELECT *
From ecom
WHERE Cart_Abandon_Rate = (SELECT MAX(Cart_Abandon_Rate) FROM ecom);

-- Only one customer with id CUST02626 has heighest cart_abandon_rate of 49.994, it has undergone only 1 session, with 1 wishlist and 10 returns labeled as IRon

SELECT * 
FROM ecom
ORDER BY Monetary Desc, Cart_Abandon_Rate Desc
LIMIT 10;    

-- Identifying customer with highest monetary and highest cart_abandon_rate         

SELECT * 
FROM ecom
ORDER BY Monetary ASC
LIMIT 10;

-- The lowest revenue generated  is of 0

SELECT * 
FROM ecom
WHERE Monetary = 0
ORDER BY Wishlist_Adds DESC;

-- The wishlist add of customers whose monetary is 0 ranges from 0 to 4 

SELECT max(Monetary) FROM ecom;

SELECT Pages_Viewed, Monetary
FROM ecom
ORDER BY Pages_Viewed DESC, Monetary DESC
LIMIT 15;
 
 -- Close to maximum values are associated with maximum page viwed of 99.
 
 
