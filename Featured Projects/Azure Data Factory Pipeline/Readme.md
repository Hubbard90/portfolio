**Project Overview**  
The Azure Data Processing Pipeline was used to process pedestrian information. Based on Melbourne’s Pedestrian Counting System, the goal was to gain insight into pedestrian movement to understand the flow dynamics of pedestrians. We then used this understanding to determine where we can improve our infrastructure.  

**What datasets were used and why?**  
Two datasets from the Melbourne Open Data API were integrated:  
-Pedestrian Dataset:	Hourly pedestrian counts by sensor & direction (≈2M rows)  
-Sensor Location Dataset:	sensor names, location descriptions, installation date, direction of travel  
The raw pedestrian dataset only includes location_id, so joining with the sensor metadata was critical for usability.   

**Resource Group Setup and containers**  
<img width="608" height="84" alt="image" src="https://github.com/user-attachments/assets/b6d63ee6-bb7b-458a-8958-da7538ade1f5" />  
<img width="359" height="104" alt="image" src="https://github.com/user-attachments/assets/67599d20-3431-411b-b87e-a53fbd0ce28a" />  
RawPedestrian – this storage is used to contain the raw pedestrian dataset that will be ingested using an API link from the Melbourne’s Pedestrian information website  
Sensorlocation – This container housed the dataset containing the 164 rows of sensor information  
Cleanedpedestrian – this container housed the csv file of the raw pedestrian after cleaning, processing, and joining through Azure Data Factory  

**Data Ingestions using ADF**  
<img width="563" height="156" alt="image" src="https://github.com/user-attachments/assets/db720c07-0032-4a4c-a1fc-4cd1448c72e3" />  

ADF pipelines used:  
_Linked Services_  
-BlobStorage – connects pipelines to containers  
-Raw Ped – REST connector pulling 1,000-row paginated batches via API  
-SensorLocations – REST connector for metadata  
-AzureSqlDatabase1 – writes final data into SQL  

_API Pagination Setup_  
The Melbourne API only returns 1,000 records per call, so pagination ensured each 15-min refresh captured the next batch rather than repeatedly ingesting the same records.  

**What transformations occurred in the Data Flow?**
<img width="604" height="254" alt="image" src="https://github.com/user-attachments/assets/f359ff15-3630-48f4-8999-897c1c20fe06" />  
Select — remove unnecessary fields & rename columns  
Join — merge raw pedestrian data with sensor metadata  
Filter — remove empty values & inconsistent records  
Aggregate — sum pedestrian counts by hour & direction  
Windowing — rank locations by pedestrian count  
Sink — write cleaned tables into Azure SQL  

**Trigger Intervals**  
A 15-minute interval trigger was configured in ADF.  
Every 15 minutes:  
<img width="374" height="353" alt="image" src="https://github.com/user-attachments/assets/47d13524-a8ac-4ff7-a31a-f300919a3358" />  

-Pull → Clean → Join → Write to SQL  
-Power BI’s DirectQuery refreshes dashboard visuals instantly.  

**PowerBI Integration**  
<img width="272" height="281" alt="image" src="https://github.com/user-attachments/assets/9d3cb050-4e33-43a2-934c-290590a4c5f1" />  
I chose “DirectQuery” under the Data Connectivity Mode to ensure the data stays updated in real time every time Azure Data Factory uploads new data into the database. With this choice, the dataset in PowerBI can simply be refreshed instead of having to import new data.  

***Pedestrian Data Analysis**  
<img width="620" height="349" alt="image" src="https://github.com/user-attachments/assets/8ee6442b-102e-4a37-9d20-bc9354350874" />  

The graph above is an overall summary of the pedestrian data in 2024:  
a. Pedestrian per Hour (Line Chart) – Displays the number of pedestrians for every hour of the day. We can see here that the peak times are 8:00 am, 12:00 to 1:00 pm, and 5:00 pm.  
b. Direction dominance ratio (coloured column charts) – These column charts display the dominance of one direction compared to the other. It is calculated by dividing them by each other: ex. Direction 1 dominance is calculated by direction 2 / direction 1. The goal is to see by how much more dominant one is compared to the other, without replying too much on the raw number for each variable.  
c. Sum of pedestrian count by directions (Column charts) – These two charts display the count of the two directions in each location. We can click a location or any hour in any other graph to see the count of any direction or click a direction to see its statistics in any other graph. In this case, let us see the pedestrian behaviour at 1:00 pm:  
<img width="604" height="340" alt="image" src="https://github.com/user-attachments/assets/21365223-21e6-4881-9416-3a0300a7f410" />  

We can see that Harbour Esplanade West has the highest direction dominance ratio of 2.22, meaning pedestrians travel in direction 1 2.22 times more than direction 2. We can click on Harbour Esplanade West and see that the dominant direction is North. Therefore, we can use this data to see if we can improve the infrastructure in this area by perhaps widening the north-facing walkways to be able to properly accommodate pedestrians.  

I also found that the morning rush is highest when highlighting East and West directions, meaning these directions are most likely going to the city centres, where offices or main public transportation are. North and South is where the afternoon rush is the highest, indicating that this is where the pedestrians are going for their lunch breaks.  

Infrastructure may need reinforcements, as we can see in the peaks, during rush hour. Seeing as North and South going pedestrians are the most dominant, we may need to reinforce those by widening the road or reducing possible chokepoints in these areas.  
