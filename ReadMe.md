**Overview**  
This project is comprised of two parts:  
1. Cluster Analysis - A cluster analysis to create profile segments based on the buying habits of the customers of each store. This will give us insight into the behaviour of each store’s general market.  
2. Market Basket Analysis and Association Rules - The goal of this type of analysis is to analyse the probability of a consumer buying an item if he or she bought an antecedent item, giving us a chance of coming up with up-selling techniques.  

This project uses SAS Enterprise Miner to analyse retail purchasing behaviour across 689 stores. The goal was to segment customers into meaningful groups using clustering techniques and identify high-value product associations using market basket analysis. These insights support data-driven decisions around product bundling, store layout, pricing strategy, and targeted marketing.

**Key Findings**
Customer Segmentation  
Using clustering and standardisation, four distinct store/customer profiles were identified.  
Examples include:  
Segment 1: Higher interest in Original & Stretch garments (active-wear leaning)  
<img width="604" height="91" alt="image" src="https://github.com/user-attachments/assets/faaa56de-236d-444f-a731-2f0b43afceb6" />

Segment 3: Strong preference for Fashion items (style-oriented customers)  
Segment 4: Prioritises Leisure items (comfort-focused customers)  
These profiles guide inventory planning, product placement, and targeted promotions.  

**Market Basket Analysis**  
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
