# Retail Sales Growth Analysis

## Introduction

This report analyses purchasing behaviour across **689 retail stores** to identify practical opportunities for increasing sales, improving inventory allocation, and strengthening cross-selling performance.

The analysis was completed using SAS Enterprise Miner and consists of two complementary methods:

1. **Cluster analysis**, used to group stores according to customer preferences across four clothing categories: Original, Stretch, Fashion, and Leisure.
2. **Market basket analysis**, used to identify products that customers frequently purchase together.

The purpose of combining these methods is to move away from a uniform retail strategy. Instead, each store can be managed according to the preferences of its local customers, while product association rules can support more effective bundles, promotions, and store layouts.

---

## Problem Overview

The company currently operates across stores with different customer profiles, but applying the same product mix, merchandising strategy, and promotional activity to every location may limit sales performance.

The main business challenges are:

- Inventory may not reflect the preferences of customers in each store.
- Low-performing categories may occupy too much shelf space.
- Strong product relationships may not be used for cross-selling.
- Promotions may rely too heavily on discounts rather than observed purchasing behaviour.
- Store layouts may not encourage customers to explore related categories.

To address these issues, the analysis focused on two questions:

1. What types of customer purchasing profiles exist across the store network?
2. Which products have the strongest potential for bundles and cross-selling?

---

## Approach

### Data Preparation and Standardisation

The cluster analysis used purchasing data from **689 stores** across four clothing categories:

- Original
- Stretch
- Fashion
- Leisure

Because the sales values differed significantly across categories, the variables were standardised before clustering. This prevented categories with larger values from dominating the grouping process.

The elbow method was initially used to assess the appropriate number of clusters. Although five clusters appeared statistically possible, the fifth cluster contained only around 1% of the dataset and was likely driven by outliers.

A four-cluster solution was therefore selected because it produced more meaningful and commercially useful store profiles.

### Cluster Analysis

The four-cluster solution identified the following store segments:

| Segment | Store count | Share of stores | Main purchasing pattern |
|---|---:|---:|---|
| Segment 1 | 236 | 34.25% | Higher interest in Original and Stretch |
| Segment 2 | 46 | 6.68% | Lower purchasing across all denim categories |
| Segment 3 | 175 | 25.40% | Strong preference for Fashion |
| Segment 4 | 233 | 33.82% | Strong preference for Leisure |

Together, Segments 1 and 4 account for approximately **68% of all stores**, showing that activewear-oriented and comfort-focused customers represent the largest opportunities across the network.

### Market Basket Analysis

Market basket analysis was used to identify relationships between products based on lift, confidence, expected confidence, and support.

The strongest association was between **toothpaste and perfume**, with:

- Lift: **3.60**
- Confidence: **32.40%**
- Support: **2.18%**
- Transaction count: **4,364**

<img width="371" height="80" alt="image" src="https://github.com/user-attachments/assets/16120ff9-8e44-490d-bfa5-a67ad2e887b7" />


A lift of 3.60 means customers who purchase one of these products are **3.6 times more likely** to purchase the other compared with a randomly selected customer.

Additional bundle opportunities included:

| Bundle | Lift | Confidence | Support |
|---|---:|---:|---:|
| Toothpaste and perfume | 3.60 | 32.40% | 2.18% |
| Magazines, candy bars, and greeting cards | 2.80 | 41.11% | 1.67% |
| Toothpaste, candy, and magazines | 2.53 | 45.86% | 1.67% |

These rules indicate that the products have stronger purchasing relationships than would be expected by chance.

---

## Business Insights

### 1. Tailor Inventory by Store Segment

The largest opportunity is to replace a uniform inventory strategy with a segment-based allocation model.

#### Segment 1: Active and Stretch-Oriented Stores  

<img width="604" height="91" alt="image" src="https://github.com/user-attachments/assets/8ba7c3c3-96ba-4e16-a3ff-aa18e2999e3e" />


Segment 1 contains **236 stores**, representing **34.25% of the network**. Customers in these stores show stronger demand for Original and Stretch products.

Recommended actions:

- Increase the allocation of Stretch and Original garments.
- Position these products around movement, durability, and everyday performance.
- Cross-sell them with sportswear and active lifestyle products.
- Reduce underperforming Fashion or Leisure stock where local demand is consistently lower.

**Proposed measurable targets:**

- Increase Original and Stretch category sales by **5% to 8%** within three months.
- Improve stock turnover in these categories by at least **10%**.
- Maintain an in-stock rate of at least **95%** for the highest-selling sizes and styles.

#### Segment 2: Low Denim Engagement Stores  

<img width="601" height="89" alt="image" src="https://github.com/user-attachments/assets/1b6a203c-ae53-4e8c-9284-47ed8a2e856b" />


Segment 2 contains only **46 stores**, or **6.68% of the network**, but shows low purchases across all denim categories.

This does not necessarily mean that these stores should receive more denim. The low engagement may indicate weak local demand, poor placement, or an unsuitable product range.

Recommended actions:

- Test improved denim visibility in high-traffic areas.
- Review whether the current range fits local customer preferences.
- Reduce excess inventory if promotions and display changes do not improve performance.
- Use smaller, targeted tests rather than increasing stock immediately.

**Proposed measurable targets:**

- Run an eight-week merchandising pilot in selected Segment 2 stores.
- Target a **5% increase in denim conversion rate**.
- Reduce denim stockholding by **10% to 15%** in stores where demand remains weak.
- Reduce markdown dependency and aged inventory by at least **10%**.

#### Segment 3: Fashion-Oriented Stores  

<img width="601" height="85" alt="image" src="https://github.com/user-attachments/assets/42be15b5-8907-48aa-82f0-d18202303247" />


Segment 3 contains **175 stores**, representing **25.40% of the network**. Fashion products significantly outperform the other categories in this segment.

Recommended actions:

- Increase Fashion inventory and new-arrival frequency.
- Refresh displays more often to encourage repeat visits.
- Prioritise trend-led campaigns and limited collections.
- Use these stores as test locations for new fashion ranges.

**Proposed measurable targets:**

- Increase Fashion category sales by **8% to 10%**.
- Improve new-arrival sell-through within the first four weeks by **10%**.
- Increase repeat visits or loyalty-member purchase frequency by **5%**.
- Reduce the time required to clear seasonal stock by **10%**.

#### Segment 4: Leisure and Comfort-Focused Stores  

<img width="601" height="86" alt="image" src="https://github.com/user-attachments/assets/bb12bc82-5b39-4086-a6e3-df95794c5cd9" />


Segment 4 contains **233 stores**, or **33.82% of the network**. Customers in these stores strongly prefer Leisure products.

Recommended actions:

- Expand comfort-focused product placement.
- Promote multi-buy offers for Leisure products.
- Use messaging based on comfort, versatility, and value.
- Maintain competitive pricing because these customers may be more price-sensitive.

**Proposed measurable targets:**

- Increase Leisure category units per transaction by **5%**.
- Improve bundle attachment rates by **3 to 5 percentage points**.
- Increase Leisure category revenue by **6% to 8%**.
- Keep promotional margin erosion below **3%** by using modest rather than heavy discounts.

---

### 2. Introduce Targeted Product Bundles

<img width="604" height="278" alt="image" src="https://github.com/user-attachments/assets/dfef13d2-1493-43cf-889b-7799c6222a20" />


The market basket analysis identified three bundles with strong cross-selling potential.

#### Toothpaste and Perfume

This was the strongest rule, with a lift of **3.60** and **4,364 associated transactions**.

Recommended action:

- Test a convenience or personal-care bundle.
- Use a modest discount of **5% to 10%** because the natural product affinity is already strong.
- Position the bundle near checkout areas or in a dedicated personal-care display.

**Proposed measurable targets:**

- Increase joint purchases by **10% to 15%**.
- Achieve a bundle take-up rate of at least **5%** among customers purchasing either item.
- Increase average basket value by **3%** in pilot stores.

#### Magazines, Candy Bars, and Greeting Cards

This bundle had a lift of **2.80** and confidence of **41.11%**.

Recommended action:

- Position it as an impulse, gifting, or seasonal bundle.
- Use it during birthdays, Valentine’s Day, holidays, and event periods.
- Place the products together near checkout or promotional areas.

**Proposed measurable targets:**

- Increase cross-category purchases by **8% to 12%**.
- Improve impulse-product revenue by **5%** during campaign periods.
- Achieve at least **3% incremental sales lift** compared with control stores.

#### Toothpaste, Candy, and Magazines

This bundle recorded the highest confidence at **45.86%**, with a lift of **2.53**.

Recommended action:

- Position it as a convenience or travel-oriented bundle.
- Test it near checkout, travel-size products, or seasonal promotion zones.
- Promote it as a quick-purchase package rather than a heavily discounted offer.

**Proposed measurable targets:**

- Increase bundle attachment by **5 percentage points**.
- Increase transaction value among participating customers by **3% to 5%**.
- Maintain gross margin by limiting the discount to no more than **10%**.

---

### 3. Optimise Store Layout Through Controlled Testing

High-affinity products can be placed together to encourage convenience and impulse buying.

Alternatively, they can be placed in separate but connected areas to increase movement across the store.

The best approach should be determined through controlled testing.

Recommended pilot:

- Select comparable stores within the same segment.
- Use one group as a control.
- Place associated products together in one test group.
- Separate the products strategically in another test group.
- Run the experiment for six to eight weeks.

The following metrics should be monitored:

- Average basket value
- Units per transaction
- Bundle attachment rate
- Cross-category penetration
- Sales per square metre
- Gross margin
- Incremental sales lift compared with the control group

A successful pilot should aim for:

- At least **3% incremental sales lift**
- A **5% increase in units per transaction**
- A **3 to 5 percentage point increase in bundle attachment**
- No more than a **2% decline in gross margin percentage**

---

### 4. Build a Segment-Based Performance Dashboard

The cluster assignments should be integrated into the company’s reporting system so that managers can compare stores against relevant peers rather than the entire network.

The dashboard should track:

- Sales by category and segment
- Inventory turnover
- Sell-through rate
- Stockout rate
- Markdown rate
- Average basket value
- Units per transaction
- Bundle attachment rate
- Gross margin
- Sales per square metre

This would allow the company to evaluate whether each store is performing appropriately for its customer profile and identify when local demand begins to change.

---

## Conclusion

The analysis shows that customer preferences vary considerably across the company’s **689-store network**.

Four meaningful store segments were identified, with activewear-oriented and leisure-focused stores accounting for approximately **68% of all locations**.

The market basket analysis also identified strong product affinities, particularly between toothpaste and perfume, which had a lift of **3.60** across **4,364 transactions**.

The key recommendation is to replace uniform merchandising with a segment-based strategy supported by controlled bundle and layout experiments.

The company should initially target an incremental sales increase of **3% to 5%** in pilot stores, while also improving stock turnover, average basket value, and bundle attachment rates.

These targets are proposed business KPIs rather than outcomes already demonstrated by the historical analysis. Their purpose is to turn the findings into measurable retail experiments before wider implementation.
