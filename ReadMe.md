**Project Overview**
For this study, the dataset used is called “Wholesale Customer Data”, which is a dataset that contains purchases of each customer from a retail grocery store. The dataset contains 440 customers with columns of continuous numeric data types. The columns refer to how much each customer spent on food, with the exception of two columns, Region and Channel, which refers to where the customers bought from (Porto, Lisbon, or others) and if they are purchased by business or personal shoppers respectively. All columns are listed below:  
<img width="132" height="156" alt="image" src="https://github.com/user-attachments/assets/18525344-c9cf-420f-8b95-2b9b229f2aa0" />  
This process will be achieved by creating two types of unsupervised clustering models: Kmeans and Hierarchical clustering. The best parameters will be chosen to properly fit the models so that we can get the best predictive score when measuring performance. For the evaluation score, silhouette will be used. This score combines two metrics:  
1. Cohesion – How close a point is to other points in a cluster  
2. Separation – How far a point is to other points in another cluster  
   
The goal when choosing the parameters would be to get a silhouette score that is as close to  
+1 as possible.  

** Process and Methodology:**  
After checking for duplicates and NAs, the features were engineered, removing the two categorical variables, *Channel* and *Region*, and splitting into X and y_region sets before standardisation. See below for the histogram of each variable of the X split before and after standardizing:  
<img width="363" height="260" alt="image" src="https://github.com/user-attachments/assets/19770c0d-dcd4-4689-9cc9-9d1a92e1a751" />  
<img width="373" height="259" alt="image" src="https://github.com/user-attachments/assets/510ba2ba-a1b2-4e75-aca1-8293e9632522" />  

**Clustering**  
*K-means:*  
Before clustering, Principal Component Analysis was done to reduce the dimensions of the data by capturing the maximum variance of the data. Because we have 6 features, the dataset has 6 dimensions. In doing so, PCA was used to reduce the dimensions to 2 by getting the two highest variances among the Principal Components. The higher the variance, the more information we get about spending behaviour. The two PCs, along with the individual and total variance are below:  
1. Overall Spending Magnitude – all items positively contributing to this PC.   
2. Food vs Household items – All food items contributing positively and household items contributing negatively.  
<img width="465" height="58" alt="image" src="https://github.com/user-attachments/assets/cdcf9b9a-5fbc-4a82-bac0-db0b86cf2adb" />  
<img width="400" height="311" alt="image" src="https://github.com/user-attachments/assets/32f0b05f-f1a7-42ca-bfa0-6913bbd8f6c8" />  
The highest silhouette score belongs to the model with 2 centroids, shown below:  
<img width="532" height="422" alt="image" src="https://github.com/user-attachments/assets/63d8c737-7dbc-4bda-896e-86c364f6192a" />  

*Hierarchical Clustering*  
For this dataset, Euclidean was chosen as the affinity, which defaulted linkage to “ward”, which minimises the variance of clusters being merged. When two clusters are merged, the algorithm computes the total variance within the cluster. See the plot below for the dendrogram created for this study:  
<img width="591" height="339" alt="image" src="https://github.com/user-attachments/assets/c2769994-c2b3-4ce3-a1db-e68b6262ff92" />  
The largest distinguishability is when the clustering model has two centroids based on the distance shown in the dendogram above. See the hierarchical clustering model below:  
<img width="536" height="426" alt="image" src="https://github.com/user-attachments/assets/1737ce05-0272-4b4f-8595-a486cd92bc1c" />  

**Model Comparison**  
<img width="520" height="162" alt="image" src="https://github.com/user-attachments/assets/514b2018-8c3f-4590-a258-496206136add" />  
Both clustering models produced two clear customer segments: a low-to-moderate spending group (KM_0/HC_0), likely representing household shoppers, and a high-spending group (KM_1/HC_1), consistent with institutional buyers such as hotels or cafés. Hierarchical clustering showed sharper separation and a higher silhouette score, indicating stronger distinction between these two segments.
