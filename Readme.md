<img width="464" height="226" alt="image" src="https://github.com/user-attachments/assets/c55da115-7fd4-445c-b6ad-53be281ec20b" />**Project Overview**  
This project uses SAS Enterprise Miner to analyse retail purchasing behaviour across 689 stores. The goal was to segment customers into meaningful groups using clustering techniques and identify high-value product associations using market basket analysis. These insights support data-driven decisions around product bundling, store layout, pricing strategy, and targeted marketing.

**Techniques & Tools Used:**  
SAS Enterprise Miner:  
StatExplore (data understanding)  
Cluster Node (unsupervised segmentation)  
Segment Profile Node (behaviour profiling)  
Association Rules Node (Apriori-style rule mining)  
Model Comparison Node  

Analytics & ML Methods:  
Feature scaling / standardisation  
Elbow method to determine optimal clusters  
Customer segmentation (4-cluster solution)  
Association Rule Mining (lift, confidence, support)  
Product bundle recommendation  
Predictive analytics lifecycle for churn modelling  
Decision Trees, Logistic Regression, Neural Network framework (conceptual)  

**Key Findings**  
Customer Segmentation  
Using clustering and standardisation, four distinct store/customer profiles were identified.  

Examples include:  
Segment 1: Higher interest in Original & Stretch garments (active-wear leaning)  
Segment 3: Strong preference for Fashion items (style-oriented customers)  
Segment 4: Prioritises Leisure items (comfort-focused customers)  

These profiles guide inventory planning, product placement, and targeted promotions.  

Market Basket Analysis:  
High-lift association rules revealed strong product affinities, such as:  
Perfume ↔ Toothpaste (Lift 3.60)  
Magazines + Candy Bars + Greeting Cards (Lift 2.8)  
Toothpaste + Candy + Magazines (Lift 2.53)  

These insights were used to design product bundles and optimise store layout for cross-selling.

**Business Impact**  
More accurate customer targeting through well-defined behavioural segments  
Improved marketing strategy using high-value product bundles  
Practical recommendations for store layout, in-aisle promotions, and seasonal campaigns  
Foundation for churn prediction using supervised models (Decision Tree, Logistic Regression, NN)  
