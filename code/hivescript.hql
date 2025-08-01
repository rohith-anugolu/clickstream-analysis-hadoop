DROP TABLE clicks;

CREATE EXTERNAL TABLE clicks (session_id int,timestamp string,item_id int,category int) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',';

LOAD DATA INPATH '/user/vm4learning/pig/Filtered_Clicks/part*' overwrite into table clicks;

select * from clicks;

DROP TABLE buys;

CREATE EXTERNAL TABLE buys (session_id int,timestamp string,item_id int,price int,quantity int) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';

LOAD DATA INPATH '/user/vm4learning/pig/Filtered_Buys/part*' OVERWRITE INTO TABLE buys;

select * from buys;

#Identify the items that users are clicking frequently

INSERT OVERWRITE LOCAL DIRECTORY '/home/vm4learning/Documents/Freq_Clicks' ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' 
select item_id,count(item_id) as count from clicks group by item_id order by count desc limit 15; 

#Items that are clicked least

INSERT OVERWRITE LOCAL DIRECTORY '/home/vm4learning/Documents/Least_Clicks' ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' 
select item_id,count(item_id) as count from clicks group by item_id order by count limit 15; 

#Identify the items that users are buying frequently

INSERT OVERWRITE LOCAL DIRECTORY '/home/vm4learning/Documents/Freq_Buys' ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' 
select item_id,count(item_id) as count from buys group by item_id order by count desc limit 15;

#Items that are bought least

INSERT OVERWRITE LOCAL DIRECTORY '/home/vm4learning/Documents/Least_Buys' ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' 
select item_id,count(item_id) as count from buys group by item_id order by count limit 15;

#Identify the items that users are buying frequently & clicking frequently

drop table clicks_freq;

drop table buys_freq;

create table clicks_freq as select item_id,count(item_id) as count from clicks group by item_id order by count desc limit 15;

create table buys_freq as select item_id,count(item_id) as count from buys group by item_id order by count desc limit 15;

INSERT OVERWRITE LOCAL DIRECTORY '/home/vm4learning/Documents/BuysAndClicks' ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' 
SELECT c.item_id, c.count, b.count 
FROM clicks_freq c JOIN buys_freq b 
ON (c.item_id = b.item_id);

#Identify the percentage of items that are clicked and bought on same session

INSERT OVERWRITE LOCAL DIRECTORY '/home/vm4learning/Documents/SameSession' ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' 
SELECT DISTINCT c.item_id,c.session_id
FROM clicks c JOIN buys b 
ON (c.session_id = b.session_id);

#finding Insights about the date where most of the transactions happened

INSERT OVERWRITE LOCAL DIRECTORY '/home/vm4learning/Documents/Transactions' ROW FORMAT DELIMITED FIELDS 
TERMINATED BY ',' select TO_DATE(timestamp),count(DAY(timestamp)) from buys group by TO_DATE(timestamp);