# AutoSense Fleet Maintenance Intelligence: Work Order Analytics and Operational Improvement Plan

AutoSense Fleet Maintenance Intelligence is a business analytics and ICT Business Analyst case study that extends my original AutoSense Diagnostics machine learning concept.

The original AutoSense Diagnostics project focused on detecting and classifying engine faults using sensor data. This project looks at the next business question:

**How can fleet managers actually use maintenance and repair data to reduce repair cost, downtime, and reactive servicing?**

Instead of only predicting faults, this project uses real fleet work-order data to understand how maintenance is currently happening, where repair costs are coming from, and what operational improvements should be prioritised by fleet managers.

The goal is to connect predictive maintenance with real business workflows, so AutoSense is not just a machine learning model, but a decision-support system for fleet operations.

---

## Business Problem

Fleet managers often deal with high repair costs, unplanned downtime, repeated faults, and inconsistent visibility across different vehicles and departments.

Even when preventive maintenance is being performed, it is not always clear whether it is reducing repair cost or improving vehicle availability. This creates a problem for decision makers because they need to know:

- Which vehicles are creating the highest repair burden
- Whether preventive maintenance is linked to lower repair costs
- Which departments or vehicle groups should be prioritised
- Whether downtime is caused by maintenance gaps or other operational factors
- Which vehicles should be reviewed for replacement, deeper inspection, or schedule changes

This project attempts to answer these questions using work-order analytics.

---

## Connection to AutoSense Diagnostics

AutoSense Diagnostics was designed as an edge-to-cloud predictive maintenance system that uses engine sensor readings to classify vehicle health and support maintenance scheduling.

This fleet management project acts as the operational layer around that model.

In simple terms:

```text
AutoSense Diagnostics
Predicts potential engine fault from sensor data

Fleet Maintenance Intelligence
Uses work-order data to decide what fleet managers should do next
```

The machine learning model can detect potential issues, but fleet managers still need a practical system that turns those alerts into actions. This project supports that by identifying what kind of maintenance patterns, cost drivers, downtime patterns, and asset risks should be monitored in the dashboard.

---

## Dataset

The dataset used is the **City of Cincinnati Fleet Preventative Maintenance and Repair Work Orders** dataset.

The API import was set to retrieve 100,000 work-order records from the public open data portal.

Each row represents one work order.

Important columns include:

- `unique_work_order_no`
- `job_type`
- `eq_equip_no`
- `work_order_status`
- `datetime_open`
- `datetime_first_labor`
- `datetime_finished`
- `datetime_closed`
- `datetime_pm_sched`
- `downtime_hrs_user`
- `downtime_hrs_shop`
- `labor_hours`
- `labor_cost`
- `parts_cost`
- `comml_cost`
- `total_cost`
- `reas_for_repair_desc`
- `dept_equip_dept_name`
- `meter_1_life_total`

The two main job types are:

- `PM`
- `REPAIR`

PM appears to refer to preventive maintenance based on the dataset title, the scheduled PM field, and the way the records are structured.

---

## Project Objective

The objective of this project is to create an operational improvement plan for fleet managers by analysing work-order patterns and identifying where AutoSense-style predictive maintenance can create business value.

Main questions explored:

1. Are PM work orders less disruptive than repair work orders?
2. Do vehicles with higher PM activity have lower repair cost?
3. Is downtime also reduced when PM activity is higher?
4. What is the biggest reason for repair?
5. Which vehicles and departments are driving normal-wear costs?
6. Does vehicle usage explain normal-wear repair cost?
7. What should fleet managers monitor in a future AutoSense dashboard?

---

## Tools Used

- Python
- Pandas
- Matplotlib
- Seaborn
- Socrata API
- Jupyter Notebook / Google Colab
- Business analysis documentation
- Operational KPI design

---

## Data Preparation

The dataset was imported through the Cincinnati open data API.

```python
api_url = "https://data.cincinnati-oh.gov/resource/2a8x-bxjm.json"

params = {
    "$limit": 100000,
    "$order": "unique_work_order_no"
}
```

After import, the data was converted into a Pandas DataFrame and checked for:

- row count
- duplicate records
- missing values
- date completeness
- job type values
- reason for repair categories
- numeric conversion for cost and downtime fields

Some date fields had missing values, especially `datetime_pm_sched`, but this is expected because scheduled PM dates should mainly apply to PM records, not repair records.

This is also a useful business finding because the quality of date capture affects how well fleet managers can monitor turnaround time, SLA compliance, and maintenance scheduling.

---

## Key Analysis and Findings

## 1. PM work orders have lower downtime than repair work orders

The first comparison looked at average downtime by job type.

PM jobs had lower average downtime than repair jobs for both user downtime and shop downtime.

![Downtime by job type user](images/downtime_by_job_type_user.png)

![Downtime by job type shop](images/downtime_by_job_type_shop.png)

The analysis showed:

| Job Type | Average User Downtime | Average Shop Downtime |
|---|---:|---:|
| PM | 85.10 | 23.46 |
| REPAIR | 274.41 | 137.08 |

This suggests that preventive maintenance work is generally less disruptive than repair work.

However, this does not prove that PM prevents repairs. A vehicle can follow maintenance schedules and still require repairs due to accidents, external damage, age, or normal wear. So the correct interpretation is:

**PM is associated with lower downtime per work order, but this is not enough to prove causality.**

---

## 2. Vehicles with higher PM activity have lower repair cost

To make the comparison more meaningful, the analysis was moved from the work-order level to the vehicle level.

Each vehicle was grouped using a PM ratio:

```text
PM ratio = PM work orders / total work orders
```

Vehicles were then placed into three PM activity bands:

- Low PM
- Medium PM
- High PM

![Average repair cost by PM activity band](images/avg_repair_cost_by_pm_band.png)

![Median repair cost by PM activity band](images/median_repair_cost_by_pm_band.png)

The result showed a clear pattern:

| PM Band | Vehicle Count | Average Repair Cost | Median Repair Cost |
|---|---:|---:|---:|
| Low PM | 876 | 25,632.18 | 10,555.45 |
| Medium PM | 1,947 | 6,636.52 | 3,937.81 |
| High PM | 304 | 1,104.88 | 718.40 |

Vehicles in the High PM group had much lower repair cost compared with vehicles in the Low PM group.

This supports the idea that preventive maintenance may help reduce expensive repair events.

The business interpretation is:

**Vehicles with stronger PM activity are associated with lower repair costs. This does not prove PM directly caused the lower cost, but it gives fleet managers a strong reason to monitor PM coverage and identify vehicles with low PM ratio and high repair spend.**

---

## 3. PM has a weaker relationship with downtime

The same PM ratio was compared with repair downtime.

![PM ratio vs repair downtime](images/pm_ratio_vs_repair_downtime.png)

The relationship between PM ratio and repair cost was clearer than the relationship between PM ratio and downtime.

This matters because downtime can be caused by factors outside preventive maintenance, such as:

- parts availability
- workshop capacity
- accident repairs
- repair complexity
- external vendor delays
- whether the vehicle was actually needed during the repair period

The main insight is:

**Preventive maintenance appears more strongly linked to cost control than to total downtime reduction. Downtime needs its own operational monitoring and should not be assumed to improve just because PM increases.**

---

## 4. Normal wear is the biggest repair driver

The next part of the analysis looked at repair reasons.

Normal wear appeared as the highest repair reason by both work-order count and total cost.

![Top 10 repair reasons by count](images/top_10_repair_reason_count.png)

![Top 10 repair reasons by total cost](images/top_10_repair_reason_cost.png)

This is important for AutoSense because normal wear is exactly the type of issue that a predictive maintenance system should help manage better.

If normal wear is the largest cost driver, AutoSense should not only detect severe faults. It should also help fleet managers monitor vehicles that are gradually becoming more expensive to maintain.

---

## 5. Normal-wear costs are concentrated in specific vehicles

The top vehicles by normal-wear repair cost were identified.

| Vehicle | Normal Wear Count | Normal Wear Cost | Normal Wear Downtime |
|---|---:|---:|---:|
| 07550 | 106 | 229,994.52 | 25,845.13 |
| X2444 | 16 | 161,704.99 | 557.90 |
| X2441 | 65 | 155,915.39 | 11,748.97 |
| 91650 | 33 | 149,464.17 | 2,138.90 |
| S61651 | 35 | 134,441.62 | 2,423.55 |

This shows that normal-wear cost is not equally spread across the fleet. A small number of vehicles are creating a large amount of repair burden.

This is a key operational finding for fleet managers.

Recommendation:

**Fleet managers should create a high-risk asset review list for vehicles with high normal-wear cost, repeated normal-wear repairs, and high downtime. These vehicles may need inspection, PM schedule changes, parts review, or replacement planning.**

---

## 6. Normal-wear cost differs strongly by department

Normal-wear repair costs were also analysed by department.

![Normal wear cost by department](images/normal_wear_cost_by_department.png)

Top departments by normal-wear total cost included:

| Department | Work Orders | Total Cost | Average Cost | Downtime |
|---|---:|---:|---:|---:|
| Fire Department Response | 4,134 | 5,953,738.74 | 1,440.19 | 483,460.59 |
| Police | 22,590 | 5,945,242.02 | 263.18 | 2,827,371.41 |
| Neighborhood Operations | 7,485 | 5,016,036.77 | 670.15 | 586,869.99 |
| Traffic and Road Div | 6,049 | 3,221,224.89 | 532.52 | 712,374.22 |
| M.S.D. | 6,765 | 2,270,606.62 | 335.64 | 986,865.90 |

This is useful because fleet managers do not only manage individual vehicles. They also need to know which departments are creating the highest demand on the maintenance system.

The result suggests that different departments may require different maintenance strategies because their vehicles are used in different ways.

For example:

- Emergency response fleets may need stronger uptime monitoring
- Police fleets may need usage-adjusted maintenance planning due to high work-order volume
- Operations fleets may need normal-wear monitoring and route/usage review

---

## 7. Vehicle usage contributes to normal-wear cost, but does not fully explain it

The project also explored whether vehicles with higher meter life totals had higher normal-wear repair cost.

![Vehicle usage vs normal-wear repair cost](images/vehicle_usage_vs_normal_wear_cost.png)

The scatter plot showed that usage alone does not cleanly explain normal-wear cost. There were high-cost vehicles across different usage levels.

To improve readability, vehicles were grouped into usage bands.

![Normal wear cost distribution by usage band](images/normal_wear_cost_distribution_by_usage_band.png)

Usage band summary:

| Usage Band | Vehicle Count | Average Normal-Wear Cost | Median Normal-Wear Cost | Average Normal-Wear Count |
|---|---:|---:|---:|---:|
| Low usage | 965 | 1,105.87 | 235.30 | 3.53 |
| Medium-low usage | 965 | 4,868.01 | 2,023.94 | 13.53 |
| Medium-high usage | 964 | 7,735.82 | 2,836.93 | 14.78 |
| High usage | 965 | 14,545.60 | 5,426.59 | 30.30 |

Higher usage bands generally had higher normal-wear cost, which makes sense operationally. However, some vehicles had unusually high cost relative to their meter values.

A limitation found here is that some meter readings appear unrealistic or very low, which makes cost-per-usage calculations unstable. This is a data quality issue and should be addressed before using meter-adjusted KPIs in production.

---

## Business Insights

## Insight 1: PM is linked to lower repair costs

Vehicles with higher PM activity had much lower average and median repair cost.

For fleet managers, this means PM coverage should be treated as a key operational KPI, not just an admin schedule.

Recommended KPI:

```text
PM coverage ratio = PM work orders / total work orders
```

Fleet managers should monitor vehicles with:

- low PM ratio
- high repair cost
- high normal-wear count
- high downtime

These vehicles should be flagged in the AutoSense dashboard.

---

## Insight 2: Downtime is not only a maintenance issue

Downtime did not show the same clean pattern as cost. This suggests that downtime is influenced by other operational constraints.

AutoSense should not only display predicted fault risk. It should also include operational downtime drivers such as:

- waiting time before labour starts
- parts availability
- shop workload
- repair type
- priority level
- external vendor involvement

This makes the system more useful for fleet managers because they can see whether downtime is caused by the vehicle, the workshop, or the process.

---

## Insight 3: Normal wear should be a main predictive maintenance focus

Normal wear was the biggest repair driver by number of work orders and total cost.

This means AutoSense should not only focus on dramatic engine failures. A lot of fleet cost comes from repeated, gradual, and expected wear.

The system should identify vehicles where normal wear is becoming abnormal.

Example alert:

```text
Vehicle has exceeded normal-wear cost threshold for its usage band.
Review PM schedule or replacement plan.
```

---

## Insight 4: Some vehicles need asset review, not just more maintenance

Some vehicles have high repair count, high normal-wear cost, and high downtime. Adding more PM may not always solve the problem.

For these assets, the better decision may be:

- replacement assessment
- component-level inspection
- warranty review
- driver behaviour review
- route or workload reassignment
- deeper root-cause analysis

This is important because predictive maintenance is not always about repairing more. Sometimes the business decision is to stop over-investing in poor-performing assets.

---

## Insight 5: Department-level monitoring is important

Normal-wear costs are concentrated in specific departments. Fleet managers should not use one maintenance strategy for the whole fleet.

Different departments likely have different usage patterns, risk levels, and uptime requirements.

AutoSense should allow filtering by:

- department
- vehicle
- job type
- repair reason
- PM band
- usage band
- downtime level
- cost level

---

## Recommended AutoSense Dashboard Features

Based on the analysis, the AutoSense fleet dashboard should include the following views.

## 1. Fleet Overview

Main KPIs:

- total work orders
- PM vs repair split
- total repair cost
- total downtime
- average downtime by job type
- open or active work orders if live data is available

## 2. PM Effectiveness View

Charts:

- median repair cost by PM band
- average repair cost by PM band
- PM ratio vs repair cost scatter plot
- PM ratio vs repair downtime scatter plot

Business use:

Fleet managers can compare vehicles with low and high PM activity, and check whether PM coverage is linked to lower repair burden.

## 3. Normal-Wear Monitoring

Charts:

- top repair reasons by count
- top repair reasons by total cost
- top vehicles by normal-wear cost
- normal-wear cost by department
- normal-wear cost by usage band

Business use:

Fleet managers can identify whether normal wear is being controlled or if specific vehicles are becoming too expensive to maintain.

## 4. High-Risk Asset List

Suggested rules:

Flag vehicles with:

- low PM ratio
- high repair count
- high repair cost
- high normal-wear cost
- high downtime
- repeated repair reasons

This list should become the main action queue for fleet managers.

## 5. Future Sensor Alert Integration

The original AutoSense Diagnostics model can feed predicted engine fault alerts into this system.

Example workflow:

```text
Sensor reading detects abnormal engine behaviour
→ AutoSense predicts fault risk
→ System checks vehicle work-order history
→ Fleet manager receives recommended action
→ Work order is created or scheduled
→ Dashboard tracks whether the action reduced future repair cost
```

---

## Recommendations

## Recommendation 1: Track PM ratio at vehicle level

Fleet managers should monitor PM ratio per vehicle instead of only counting PM work orders overall.

Low PM ratio combined with high repair cost is a strong signal for intervention.

## Recommendation 2: Prioritise normal-wear cost reduction

Normal wear is the largest repair driver in this dataset, so AutoSense should focus on early detection of wear-related patterns.

This includes:

- repeated normal-wear repairs
- rising normal-wear cost
- normal-wear cost above usage band average
- high-cost assets despite regular PM

## Recommendation 3: Separate repair cost and downtime strategies

Repair cost and downtime should not be treated as the same problem.

The analysis showed that PM has a clearer relationship with lower repair cost than with downtime. Downtime may require process improvements such as better parts planning, labour allocation, and vendor coordination.

## Recommendation 4: Create department-level maintenance strategies

Departments with high normal-wear cost should be reviewed separately.

The same PM schedule may not work for every fleet type. Emergency response, police, and operations vehicles likely have different usage intensity and service expectations.

## Recommendation 5: Improve meter data quality before using cost-per-usage KPIs

Some meter readings appear very low or unreliable, which creates extreme cost-per-usage values.

Before deploying meter-adjusted KPIs, the business should validate:

- meter reading rules
- missing or zero meter values
- unrealistic meter values
- whether meter means mileage, hours, or another usage measure

This is a data governance requirement before the dashboard can be fully trusted.

---

## Limitations

This analysis does not prove that preventive maintenance directly causes lower repair costs. The results show association only.

Other factors may influence repair cost and downtime, such as:

- vehicle age
- accident history
- department usage intensity
- driver behaviour
- parts availability
- workshop capacity
- road conditions
- external vendor delays

The dataset also contains some data quality issues, especially with meter readings and some date fields. These should be improved in a production version of AutoSense.

---

## Final Business Value

This project shows how AutoSense can move beyond fault prediction and become an operational decision-support platform for fleet managers.

The value is not only in predicting engine faults. The bigger value is helping fleet managers decide:

- which vehicles need attention first
- where repair cost is increasing
- whether PM schedules are working
- which assets may need replacement
- which departments need different maintenance plans
- where downtime is caused by process issues rather than vehicle issues

By combining predictive machine learning with work-order analytics, AutoSense can help fleets shift from reactive repair decisions to a more proactive, data-driven maintenance strategy.

---

## Key Takeaways

- PM jobs had lower downtime than repair jobs.
- Vehicles with higher PM activity showed lower repair costs.
- The relationship between PM and downtime was weaker, meaning downtime has other operational drivers.
- Normal wear was the biggest repair reason by count and total cost.
- Some vehicles and departments account for a large share of normal-wear costs.
- Vehicle usage contributes to normal-wear cost, but it does not fully explain outliers.
- AutoSense should monitor PM coverage, repair cost, downtime, normal wear, and high-risk assets together.

This project demonstrates business analysis, operational analytics, and data-driven system design. It connects a machine learning concept to the real decisions fleet managers need to make every day.
