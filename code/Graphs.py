import pandas as pd
import pylab as py
import matplotlib.pyplot as plt
import numpy as np

data = pd.read_csv('Clicks.txt',header=None)
#Eliminating scientific format
ax = plt.gca()
ax.get_xaxis().get_major_formatter().set_scientific(False)
labels=data[0]
ax=data[[1]].plot(kind='bar',legend=False,width=0.8)
ax.set_xlabel('Item_ID',fontsize=12)
# naming the y-axis
ax.set_ylabel('Frequency',fontsize=12)
ax.set_xticklabels(labels,rotation=15)
# plot title
ax.set_title('Most Frequently Clicked Items',fontsize=14)
plt.subplots_adjust(bottom=0.2)
plt.show()


data = pd.read_csv('Buys.txt',header=None)
ax = plt.gca()
ax.get_xaxis().get_major_formatter().set_scientific(False)
labels=data[0]
ax=data[[1]].plot(kind='bar',legend=False,width = .8)
ax.set_xlabel('Item_ID',fontsize=12)
# naming the y-axis
ax.set_ylabel('Frequency',fontsize=12)
ax.set_xticklabels(labels,rotation=15)
# plot title
ax.set_title('Most Frequently Bought Items',fontsize=14)
plt.subplots_adjust(bottom=0.2)
plt.show()


data=pd.read_csv('BuysandClicks.txt',header=None)
ax = plt.gca()
ax.get_xaxis().get_major_formatter().set_scientific(False)
labels=data[0]
fig = plt.figure()
ax=data[1].plot(kind = 'bar', color = 'blue', position = 0,width=0.3,legend=True,label='Clicks')
ax=data[2].plot(kind = 'bar', color = 'gold', position = 1,width=0.3,legend=True,label='Buys')
ax.set_xticklabels(labels,rotation='horizontal')
ax.set_xlabel('Item_ID',fontsize=12)
ax.set_ylabel('Frequency',fontsize=12)
plt.subplots_adjust(bottom=0.2)
plt.title("Items that are Clicking and Buying Frequently")
plt.show()

data1 = pd.read_csv('BuysandClicks.txt',header=None)
data2 = pd.read_csv('Sessions.txt',header=None)
lbl="Clicks & Buys on same session","Clicks & Buys on different sessions"
colors='gold','lightskyblue'
a=data1.shape[0]
b=data2.shape[0]-data1.shape[0]
slices=[a,b]
plt.pie(slices,explode=(0,0.25),colors=colors,shadow=True,autopct='%1.1f%%')
plt.title("Session based Insights",fontsize=15)
plt.legend(labels=lbl,loc="best")
plt.axis('equal')
plt.tight_layout()
plt.show()

data = pd.read_csv('Trans.txt',header=None)
print(data)
plt.bar(data[0],data[1],width = 0.8)
#plt.plot(data[0],data[1], color='green', linestyle='dashed', linewidth = 3,
#         marker='o', markerfacecolor='blue', markersize=12)
plt.xlabel('Date',fontsize=13)
# naming the y-axis
plt.ylabel('Count',fontsize=13)
# plot title
plt.title('Most No of Transactions',fontsize=16)
plt.show()

data = pd.read_csv('HourWise.txt',header=None)
print(data)
labels=data[0]
plt.bar(data[0],data[1],width = 0.8)
#plt.plot(data[0],data[1], color='green', linestyle='dashed', linewidth = 3,
#         marker='o', markerfacecolor='blue', markersize=12)
plt.xlabel('Hour',fontsize=13)
# naming the y-axis
plt.ylabel('Count',fontsize=13)
# plot title
plt.title('Most No of Transactions HourWise',fontsize=16)
plt.show()