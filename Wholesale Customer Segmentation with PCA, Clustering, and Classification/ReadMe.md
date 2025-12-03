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
<img width="465" height="58" alt="image" src="https://github.com/user-attachments/assets/cdcf9b9a-5fbc-4a82-bac0-db0b86cf2adb" />  
1. Overall Spending Magnitude – all items positively contributing to this PC.   
2. Food vs Household items – All food items contributing positively and household items contributing negatively.  

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

<img width="313" height="39" alt="image" src="https://github.com/user-attachments/assets/9457b980-e44f-4fdb-9f72-43ac812df6d7" />  

In the end, the hierarchical model had a higher silhouette score. Hierarchical clustering is highly interpretable through dendrograms and can determine the number of clusters automatically, but it is sensitive to noise, computationally expensive, and prone to error propagation if early merges are suboptimal. K-means, in contrast, is simple, fast, and effective for large datasets but requires a predefined number of clusters, is sensitive to initial centroid placement, and performs poorly on non-globular or unevenly distributed data. Overall, K-means offers efficiency, while hierarchical methods provide richer interpretability at the cost of scalability.

**Supervised vs Unsupervised**
To compare clustering and classification fairly, the predicted cluster labels were first aligned with the true Region labels using the Hungarian algorithm. After this mapping, all models were evaluated using accuracy, precision, recall, F1-score, and confusion matrices, since silhouette cannot be used for supervised models. All models were trained on PCA-transformed features, with supervised models explaining roughly 95% of the variance.  

*Supervised Model Results:*  
1. Random Forest  
<img width="308" height="234" alt="image" src="https://github.com/user-attachments/assets/770eeb46-a7b6-4162-8cc0-9c6291a6f2c7" />

3. Logistic Regression  
<img width="307" height="235" alt="image" src="https://github.com/user-attachments/assets/e5c6d0c6-94c5-471b-9044-077c97269c41" />

5. Support Vector Machine (SVM)  
<img width="310" height="236" alt="image" src="https://github.com/user-attachments/assets/d3c1c198-29cd-4dd2-bed5-b1125ae6d724" />

7. K-Means Clustering  
<img width="312" height="222" alt="image" src="https://github.com/user-attachments/assets/0574a91b-8836-486a-9fed-9491e22ea978" />

9. Hierarchical Clustering  
<img width="314" height="220" alt="image" src="https://github.com/user-attachments/assets/bbde7b94-42f7-477e-b98b-1407f8b2f8ae" />  

Based on the results above, we can see that there is a significant bias for class 3. This is because class 3 greatly outnumbers the two other classes, based on the graph below:  
<img width="337" height="269" alt="image" src="https://github.com/user-attachments/assets/83b2622d-69c3-4058-87cd-23230c750b88" />  
To provide better distribution between classes, SMOTE was performed:  
<img width="339" height="264" alt="image" src="https://github.com/user-attachments/assets/b3ba0800-8643-4947-9ed9-21398cb2fff5" />  

Applying SMOTE addresses the class imbalance, improving the performance of recall in some models but at the cost of precision and accuracy. This can sometimes be a worthwhile trade but may lead to an unnecessary number of false positives. The best performing classes are below:  
• Accuracy: Logistic Regression (0.7197)  
• F1: Hierarchical Model 2 clusters (0.3412)  
• Precision: Logistic Regression with SMOTE and PCA (0.3816)  
• Recall: Baseline SVM (0.3822)  

**Business Recommendation**  

*Customer Segment 1*:  
Customer segment 1 (HC_0 & KM_0) are customers with lower annual spending compared to segment 2. These customers have a smaller market basket, which indicate that they are more price sensitive. A great strategy would be to offer low cost, but higher volume household items, especially for fresh produce bundles, or combining their highest spending categories into cross-selling bundles like fresh produce and milk. Placing these two items next to each would increase their sales, since these customers are more likely to buy both. Or laundry items can be placed in between these two categories so customers have a chance to buy other items while they are on the way to get item 2 from item 1’s area.  
Another recommendation for increasing price per volume is to encourage the use of loyalty credits or bonuses that reward customers for buying consistently with big discounts at the end of the month. For example, purchasing a combined 100 AUD worth of fresh produce and milk in 3 months would grant the customer a 30% discount at the end of the 3rd month. These customers buying household items have a higher tendency to buy items for the long term, so promoting bundles as “buy more to save more” promotions would increase their spending.  

*Customer segment 2*:  
Customer segment 2 (HC_1 & KM_1) spend more annually compared to segment 1, especially for milk, fresh produce, and grocery items. As mentioned before, these segments are most likely large retailers, hotels, or food and beverage establishments. These customer types would benefit the most from bulk orders and reliability in meeting consistent demand.  
Retention and loyalty programs would ensure long term partnerships with these customers, especially with long term contracts that provide bulk discounts. These customers would less likely switch to a different provider.  
Tiered discounts can also promote larger orders; the larger their orders are, the bigger the discount. This makes it cheaper logistic-wise, since it is much cheaper to buy large volume with lesser delivery frequency.  
Having better communication and planning with partners, in the long term, make it cheaper for the suppliers. According to Food Market Hub (n.d.), “Collaborative planning involves sharing forecasts and insights with your suppliers. By integrating their expertise with your requirements, you can optimize inventory levels, reduce wastage, and enhance overall supply chain efficiency  
