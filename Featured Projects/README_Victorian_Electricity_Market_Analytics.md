# Victorian Electricity Market Analytics

## Demand, Price and Peak-Period Insights using AEMO Data

### Project Overview

This project analyses Victorian electricity demand and wholesale prices using Australian Energy Market Operator (AEMO) data. The goal is to identify peak-demand periods, examine the relationship between electricity demand and Regional Reference Price (RRP), and understand when price spikes are most likely to occur.

The analysis is designed to support practical decision-making around demand management, pricing, procurement and market risk.

## Tools Used

- PostgreSQL
- SQL
- pgAdmin 4
- Power BI
- AEMO market data

## Approach

Eight months of 5-minute Victorian AEMO price and demand data were loaded into PostgreSQL.

SQL was used to:

- identify monthly morning and evening peak-demand hours
- calculate average demand and RRP during peak periods
- measure the relationship between demand and RRP using Pearson correlation
- compare morning and evening peak behaviour
- consolidate monthly correlation results using Fisher's z-transformation
- investigate extreme wholesale price movements

## Key Findings

### 1. Demand and wholesale price are moderately related during peak periods

After identifying the highest-demand morning and evening hours for each month, the analysis found a moderate positive relationship between total demand and RRP during both peak periods.

The relationship was slightly stronger during the morning peak than during the evening peak.

### 2. Evening peaks are more expensive

Across the eight months analysed:

| Metric | Morning Peak | Evening Peak |
|---|---:|---:|
| Average Peak Demand | ~5,866 MW | ~6,640 MW |
| Average RRP | ~$61.48/MWh | ~$87.40/MWh |

Evening periods therefore experienced both higher electricity demand and substantially higher wholesale prices.

### 3. Demand does not fully explain extreme price spikes

The largest RRP spikes tended to occur around peak-demand periods, but demand and price did not move together consistently enough to explain the size of these events.

This suggests that additional market conditions contribute to extreme wholesale pricing.

## Business Implications

### Reduce exposure during evening peaks

Evening periods showed both higher demand and higher average RRP. Energy retailers could prioritise demand-response initiatives during these hours, including incentives for off-peak EV charging, battery usage and other flexible household consumption.

### Use demand as an early warning signal

Demand is useful for identifying periods with greater exposure to higher wholesale prices, but it should not be used as a standalone decision metric. Generation availability, renewable output, outages and interconnector conditions should also be considered when assessing market risk.

### Strengthen peak-period forecasting

Monitoring recurring morning and evening peak windows could help commercial teams identify higher-cost periods earlier and support procurement, pricing and customer-demand strategies.

## Dashboard

Add a screenshot of the Power BI dashboard here:

```markdown
![Victorian Electricity Market Dashboard](images/dashboard.png)
```

Suggested dashboard components:

- average and maximum RRP
- average and peak demand
- demand and RRP by hour
- monthly peak-period comparison
- demand vs RRP scatter plot
- extreme price-event monitoring
- interactive month and hour filters

## Example SQL Analysis

The following logic identifies the highest-demand morning and evening hour for each month.

```sql
WITH hourly_demand AS (
    SELECT
        DATE_TRUNC('month', settlementdate) AS month,
        EXTRACT(HOUR FROM settlementdate) AS hour,
        CASE
            WHEN EXTRACT(HOUR FROM settlementdate) BETWEEN 5 AND 10
                THEN 'Morning Peak'
            WHEN EXTRACT(HOUR FROM settlementdate) BETWEEN 16 AND 21
                THEN 'Evening Peak'
        END AS peak_period,
        AVG(totaldemand) AS avg_demand
    FROM vic_price_demand_2026
    WHERE EXTRACT(HOUR FROM settlementdate) BETWEEN 5 AND 10
       OR EXTRACT(HOUR FROM settlementdate) BETWEEN 16 AND 21
    GROUP BY
        DATE_TRUNC('month', settlementdate),
        EXTRACT(HOUR FROM settlementdate),
        peak_period
),
ranked_hours AS (
    SELECT
        month,
        peak_period,
        hour,
        avg_demand,
        ROW_NUMBER() OVER (
            PARTITION BY month, peak_period
            ORDER BY avg_demand DESC
        ) AS demand_rank
    FROM hourly_demand
)
SELECT *
FROM ranked_hours
WHERE demand_rank = 1;
```

## Conclusion

The analysis found a moderate positive relationship between electricity demand and wholesale prices during both morning and evening peak periods. Evening peaks were associated with higher average demand and substantially higher RRP, making them particularly important from a commercial perspective.

In the short term, these findings can support peak-period monitoring, demand-response initiatives and pricing decisions. In the longer term, combining demand data with generation mix, renewable output, outages, weather and interconnector conditions could improve forecasting and provide a stronger basis for procurement and market-risk decisions.

## Data Source

Australian Energy Market Operator (AEMO) - Victorian price and demand data.

## Next Steps

- incorporate generation mix and renewable output
- add weather variables
- analyse interconnector conditions and outages
- extend the analysis to other NEM regions
- build short-term demand and price forecasting models
