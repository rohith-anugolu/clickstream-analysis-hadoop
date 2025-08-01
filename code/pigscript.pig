A = LOAD '/user/vm4learning/sqoop/Buys/part-*' using PigStorage(',') as (session_id:int,timestamp:chararray,item_id:int,price:int,category:int);

B = DISTINCT A;

C = FILTER B BY ($0 is not null) AND ($1 is not null) AND ($2 is not null) AND ($3 is not null) AND ($4 is not null);

DUMP C;

STORE C INTO '/user/vm4learning/pig/Filtered_Buys' using PigStorage(',');


A = LOAD '/user/vm4learning/sqoop/Clicks/part-*' using PigStorage(',') as (session_id:int,timestamp:chararray,item_id:int,category:int);

B = DISTINCT A;

C = FILTER B BY ($0 is not null) AND ($1 is not null) AND ($2 is not null) AND ($3 is not null);

DUMP C;

STORE C INTO '/user/vm4learning/pig/Filtered_Clicks' using PigStorage(',');
