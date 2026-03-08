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
Segment 2: Lower purchases across all jeans categories, indicating that customers are not interested in denim products in this store. 
<img width="601" height="89" alt="image" src="https://github.com/user-attachments/assets/0e37adc2-67e0-4838-850c-4dde488e6a39" />  
Segment 3: Strong preference for Fashion items (style-oriented customers)  
<img width="601" height="85" alt="image" src="https://github.com/user-attachments/assets/58544237-32b3-435f-bb38-b17c472f3dab" />  
Segment 4: Prioritises Leisure items (comfort-focused customers)  
<img width="601" height="86" alt="image" src="https://github.com/user-attachments/assets/842b6f8c-4fce-43f5-9fb6-b89dd30f54c8" />  
These profiles guide inventory planning, product placement, and targeted promotions.  

**Market Basket Analysis**  
High-lift association rules revealed strong product affinities, such as:  
Perfume & Toothpaste (Lift 3.60): Customers who buy perfume are 3.6 times more likely to buy toothpast  
<img width="371" height="80" alt="image" src="https://github.com/user-attachments/assets/9c6d477b-7ab6-40a2-90f0-857e2e1bffc5" />

**Product Bundles:**  
I used this matrix plot to reveal the best cross-selling opportunities between high-volume items: 
<img width="915.6" height="459.2" alt="image" src="https://github.com/user-attachments/assets/821b2d08-d413-46a2-90c8-9463ebe95b8b" />

The three product bundles I recommend:  
Toothpaste + Perfume (Lift: 3.60, Confidence: 32.40%, Support: 2.18%)
Magazines + Candy Bars + Greeting Cards (Lift 2.8, Confidence: 41.11%, Support: 1.67%)  
Toothpaste + Candy + Magazines (Lift: 2.53, Confidence: 45.86%, Expected Confidence: 17.10%, Support: 1.67%)
  
These insights were used to design product bundles and optimise store layout for cross-selling.  

*Business Recommendations*  
The cluster analysis and market basket analysis generated actionable strategies across merchandising, store layout, and promotional planning. The recommendations below translate analytical findings into measurable retail decisions.  

1. Segment-Based Store Strategy  
-Customer preferences vary significantly across store clusters. A uniform merchandising strategy would reduce effectiveness.  
-Segment 1 – Active/Stretch Focus  
-Increase activewear allocation  
-Cross-sell with complementary sports items  
-Position store messaging around performance  

	Segment 2 – Low Denim Engagement  
	-Improve denim visibility in high-traffic areas  
	-Test targeted promotions  
	-Optimise inventory levels  

	Segment 3 – Fashion-Oriented  
	-Increase fashion inventory turnover  
	-Refresh visual displays frequently  
	-Prioritise new-arrival marketing  

	Segment 4 – Leisure-Focused  
	-Emphasise comfort positioning  
	-Bundle leisure items  
	-Maintain competitive pricing  

2. Product Bundling Strategy  
High-lift association rules identified strong cross-selling opportunities:  
-Toothpaste + Perfume (Lift: 3.60)  
-Magazines + Candy + Greeting Cards (Lift: 2.8)  
-Toothpaste + Candy + Magazines (Lift: 2.53)  

	Action:  
	-Introduce themed bundles with modest 5–10% discounts  
	-Align bundles with seasonal campaigns  
	-Promote as impulse or convenience packs  
	-Because affinity is already strong, heavy discounting is unnecessary.  

3. Store Layout Optimisation  
Use association insights to redesign shelf placement:  
-Place high-affinity items near each other to increase impulse purchases  
-Alternatively, separate them strategically to increase cross-aisle traffic  
Pilot test layout adjustments and measure:  
-Basket size  
-Cross-category penetration  
-Incremental sales lift  
