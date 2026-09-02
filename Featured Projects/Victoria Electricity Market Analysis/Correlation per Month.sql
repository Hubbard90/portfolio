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
),

monthly_peak_hours AS (
    SELECT
        month,
        peak_period,
        hour AS peak_hour,
        avg_demand AS peak_avg_demand
    FROM ranked_hours
    WHERE demand_rank = 1
)

SELECT
    p.month,
    p.peak_period,
    p.peak_hour,
    p.peak_avg_demand,
    CORR(v.totaldemand, v.rrp) AS correlation,
    AVG(v.rrp) AS avg_rrp,
    COUNT(*) AS intervals
FROM monthly_peak_hours p
JOIN vic_price_demand_2026 v
    ON DATE_TRUNC('month', v.settlementdate) = p.month
    AND EXTRACT(HOUR FROM v.settlementdate) = p.peak_hour
GROUP BY
    p.month,
    p.peak_period,
    p.peak_hour,
    p.peak_avg_demand
ORDER BY
    p.month,
    p.peak_period;