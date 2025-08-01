echo "----------------------"
echo "Executing hadoop jobs"
echo "----------------------"

cd $HADOOP_HOME
bin/start-all.sh
bin/hadoop fs -rmr /user/vm4learning/sqoop/*
bin/hadoop fs -rmr /user/vm4learning/pig/*

echo "-------------------------"
echo "Importing data from Mysql"
echo "-------------------------"

cd $SQOOP_HOME

#Importing data from Buys Table

bin/sqoop import --connect jdbc:mysql://localhost/hcatalog --table Buys --target-dir /user/vm4learning/sqoop/Buys -m 1

#Importing data from Clicks Table

bin/sqoop import --connect jdbc:mysql://localhost/hcatalog --table Clicks --target-dir /user/vm4learning/sqoop/Clicks -m 1

echo "----------------------"
echo "Executing pig scripts"
echo "----------------------"

cd $PIG_HOME

bin/pig -f /home/vm4learning/Desktop/pigscript.pig

echo "----------------------"
echo "Executing hive queries"
echo "-----------------------"

cd $HIVE_HOME

bin/hive -f /home/vm4learning/Desktop/hivescript.hql

echo "----------------------"
echo "Task Completed!!!"
echo "-----------------------"
