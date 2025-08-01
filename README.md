# Clickstream Data Analysis Using Hadoop Ecosystem

This project analyzes user clickstream data to uncover behavioral trends on an e-commerce platform. It was implemented as an academic project during my undergraduate studies and demonstrates a full ETL + analytics process using the Hadoop ecosystem. The final results include query outputs and visualizations generated from structured click logs.

---

## 🛠️ Tools & Technologies

Apache Hadoop, HDFS, Apache Pig, Apache Hive, Sqoop, MySQL, Python (Matplotlib), Bash scripting, Ubuntu (Cloudera QuickStart VM)

---

## 🎯 Problem Statement

Clickstream logs contain valuable insights about user behavior, but processing such large-scale data requires a distributed architecture. This project builds an end-to-end data processing and analytics pipeline using Hadoop tools to extract key engagement patterns from raw clickstream data.

---

## 🧪 Approach

- Imported clickstream data from **MySQL** into HDFS using **Sqoop**  
- Transformed and filtered logs using **Pig scripts**  
- Analyzed user activity using **HiveQL** queries:
  - Top clicked and purchased items  
  - Hourly and daily browsing trends  
  - Conversion behavior by session
- Visualized key results using **Python (Matplotlib)**
- Automated the entire workflow using a **Bash script**

---

## 📊 Results

- Identified peak browsing hours and frequently purchased categories  
- Mapped click-to-buy behavior and session-based engagement  
- Created charts and summaries for non-technical consumption  
- Demonstrated effective usage of the Hadoop stack for data analysis

---

## 📄 Files

- `/code/graphs.py` – Python code for visualizing Hive query results  
- `/code/hadoop.sh` – Shell script automating Sqoop, Pig, and Hive workflows  
- `/code/hivescript.hql` – HiveQL file containing data aggregation queries  
- `/code/pigscript.pig` – Pig script to clean and structure raw log data  
- `/report/clickstream_outputs_summary.pdf` – Report containing result tables and visualizations

---

## 🔗 Notes

- This project was executed on a manually configured **Hadoop environment on Ubuntu**
- Dataset is not included due to academic access restrictions  
