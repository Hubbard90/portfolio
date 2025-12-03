**Project Overview**
The Azure Data Processing Pipeline was used to process pedestrian information. Based on Melbourne’s Pedestrian Counting System, the goal was to gain insight into pedestrian movement to understand the flow dynamics of pedestrians. We then used this understanding to determine where we can improve our infrastructure.  

**What datasets were used and why?**
Two datasets from the Melbourne Open Data API were integrated:
-Pedestrian Dataset:	Hourly pedestrian counts by sensor & direction (≈2M rows)
- Sensor Location Dataset:	sensor names, location descriptions, installation date, direction of travel
The raw pedestrian dataset only includes location_id, so joining with the sensor metadata was critical for usability.  

**Resource Group Setup and containers**  
<img width="608" height="84" alt="image" src="https://github.com/user-attachments/assets/b6d63ee6-bb7b-458a-8958-da7538ade1f5" />  
<img width="359" height="104" alt="image" src="https://github.com/user-attachments/assets/67599d20-3431-411b-b87e-a53fbd0ce28a" />  
RawPedestrian – this storage is used to contain the raw pedestrian dataset that will be ingested using an API link from the Melbourne’s Pedestrian information website  
Sensorlocation – This container housed the dataset containing the 164 rows of sensor information  
Cleanedpedestrian – this container housed the csv file of the raw pedestrian after cleaning, processing, and joining through Azure Data Factory  

**Data Ingestions using ADF**  
ADF pipelines used:  
_Linked Services_  
-BlobStorage – connects pipelines to containers  
-Raw Ped – REST connector pulling 1,000-row paginated batches via API  
-SensorLocations – REST connector for metadata  
-AzureSqlDatabase1 – writes final data into SQL  

_API Pagination Setup_  
The Melbourne API only returns 1,000 records per call, so pagination ensured each 15-min refresh captured the next batch rather than repeatedly ingesting the same records.  
