-- Query: Detect temperature anomalies using LAG()
-- Challenge: Find sensors dengan temperature swing >10°C
-- Output columns: sensor_id, current_temp, prev_temp, temperature_diff, anomaly_level, recorded_at
-- Notes/assumptions:
-- 1) Using `sensor_readings_hist` table (sample DB uses this name). If your production table
--    is `sensor_readings`, change the FROM clause accordingly.
-- 2) Classification thresholds (adjustable):
--    HIGH   : temp_diff > 20.0
--    MEDIUM : temp_diff > 10.0 AND temp_diff <= 20.0
--    LOW    : temp_diff > 0 AND temp_diff <= 10.0  -- included for completeness

WITH temperature_analysis AS (
	SELECT
		sensor_id,
		temperature AS current_temp,
		recorded_at,
		LAG(temperature) OVER (PARTITION BY sensor_id ORDER BY recorded_at) AS prev_temp
	FROM sensor_readings_hist
),
anomalies AS (
	SELECT
		sensor_id,
		current_temp,
		prev_temp,
		-- Calculate absolute difference; NULLs ignored later
		ABS(current_temp - prev_temp) AS temperature_diff,
		recorded_at,
		CASE
			WHEN prev_temp IS NULL THEN NULL
			WHEN ABS(current_temp - prev_temp) > 20.0 THEN 'HIGH'
			WHEN ABS(current_temp - prev_temp) > 10.0 THEN 'MEDIUM'
			WHEN ABS(current_temp - prev_temp) > 0.0 THEN 'LOW'
			ELSE NULL
		END AS anomaly_level
	FROM temperature_analysis
)
SELECT
	sensor_id,
	current_temp,
	prev_temp,
	temperature_diff,
	anomaly_level,
	recorded_at
FROM anomalies
WHERE temperature_diff IS NOT NULL
	AND temperature_diff > 10.0
ORDER BY temperature_diff DESC, recorded_at DESC;

