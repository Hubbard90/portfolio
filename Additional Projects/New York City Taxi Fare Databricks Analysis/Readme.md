**Project Overview**  
This study’s goal is based on the New York City Taxi & Limousine Commission’s dataset for the year 2019. The goal is to analyse the price based on miles and find if there are inequities, and to see if there are improvements in infrastructure organisation that are worth enforcing.  
Databricks will be used to analyse the dataset. The dataset is a very large file containing more than eighty million rows. To work around this, I will be using an API to import a dataset with seven hundred thousand rows instead. I used Python with the following code:  
<img width="511" height="464" alt="image" src="https://github.com/user-attachments/assets/bd9f1589-e686-4902-95e1-ae1ea2b79472" />  

_Pricing Inequities:_  
<img width="453" height="280" alt="image" src="https://github.com/user-attachments/assets/ac536253-0eec-49f8-a296-551b2437eaac" />  

_Top 10 cheapest average fare miles:_  
<img width="384" height="276" alt="image" src="https://github.com/user-attachments/assets/e4cc6ef4-f37a-46f1-9455-e211109a8a48" />  

_Top 10 average fare miles during peak hours:_  
<img width="454" height="277" alt="image" src="https://github.com/user-attachments/assets/bfff6aa1-ea6f-4f6b-91db-cedbed1fb380" />  

_Top 10 during off peak hours:_  
<img width="453" height="275" alt="image" src="https://github.com/user-attachments/assets/3bcda7df-b1cc-4eea-bbce-d200b1c9e615" />  

The overall average of the off-peak and peak hour rides is roughly the same, being 7.52 and 7.50 USD per mile. However, if we get the top 10 of both, the range of off-peak rides is much higher, with the highest being 660 USD. That is almost double the highest peak hour’s location.   

**Morning and Evening Peak Comparison**

_Top 10 Dropoff_  
<img width="600" height="256" alt="image" src="https://github.com/user-attachments/assets/b404e8c0-5cf8-4056-82b3-4abd230777eb" />  
<img width="437" height="282" alt="image" src="https://github.com/user-attachments/assets/b6f85b52-0471-4bea-98cb-957ce850c152" />  

_Top 10 Pickup_  
<img width="601" height="251" alt="image" src="https://github.com/user-attachments/assets/1728cba8-e253-4de5-bb21-74ab2e2ea00c" />  
<img width="423" height="279" alt="image" src="https://github.com/user-attachments/assets/cf91e359-0ed1-4a71-9556-711c3b0b7f31" />  

**Taxi Infrastructure Recommendation**  
Based on the two graphs above, location 161 is the dominant area in both pickup and dropoff variables, followed by 237, 236, and 186 for pickup variables, and 161, 236, and 237 for drop-off. These locations are the only ones that have a combined number of rides exceeding 10,000. I recommend provisioning resources for infrastructure in these locations.  

Building on this, these areas are likely major transit hubs or high-density commercial locations, which explains the heavy turnover. Because of this, improving infrastructure in these zones can significantly reduce congestion and make taxi movement more efficient.  

The following are my recommendations:  
-Increase designated pickup/drop-off areas to reduce double-parking and wait-time congestion.  
-Add more structured taxi stands so queues move faster and drivers aren’t circling for passengers.  
-Improve curbside management during peak hours (e.g., temporary loading zones) to handle sudden surges in demand.  
-Use real-time monitoring to adjust traffic flow or signal timing in these hotspots.  
-Review short-trip pricing in these zones since congestion can cause inflated cost-per-mile for passengers.  

Overall, strengthening infrastructure in these high-volume locations will improve traffic flow, reduce driver idle time, and create a more efficient system for both passengers and taxis.
