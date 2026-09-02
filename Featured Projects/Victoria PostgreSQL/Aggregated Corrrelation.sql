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
),

monthly_results AS (
    SELECT
        p.month,
        p.peak_period,
        p.peak_hour,
        p.peak_avg_demand,

        CORR(v.totaldemand, v.rrp) AS monthly_correlation,

        AVG(v.rrp) AS monthly_avg_rrp

    FROM monthly_peak_hours p

    JOIN vic_price_demand_2026 v
        ON DATE_TRUNC('month', v.settlementdate) = p.month
        AND EXTRACT(HOUR FROM v.settlementdate) = p.peak_hour

    GROUP BY
        p.month,
        p.peak_period,
        p.peak_hour,
        p.peak_avg_demand
),

fisher_values AS (
    SELECT
        peak_period,
        peak_avg_demand,
        monthly_avg_rrp,
        monthly_correlation,

        0.5 * LN(
            (1 + monthly_correlation) /
            (1 - monthly_correlation)
        ) AS fisher_z

    FROM monthly_results

    WHERE monthly_correlation IS NOT NULL
      AND monthly_correlation > -1
      AND monthly_correlation < 1
),

fisher_summary AS (
    SELECT
        peak_period,

        AVG(fisher_z) AS avg_fisher_z,

        AVG(peak_avg_demand) AS avg_peak_demand,

        AVG(monthly_avg_rrp) AS avg_peak_rrp,

        COUNT(*) AS months

    FROM fisher_values

    GROUP BY peak_period
)

SELECT
    peak_period,

    (
        EXP(2 * avg_fisher_z) - 1
    )
    /
    (
        EXP(2 * avg_fisher_z) + 1
    ) AS fisher_avg_correlation,

    avg_peak_demand,
    avg_peak_rrp,
    months

FROM fisher_summary

ORDER BY peak_period;
