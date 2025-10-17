-- If you want to include sensors that don't have a matching truck, use LEFT JOIN
SELECT
    s.sensor_id,
    s.sensor_type,
    s.truck_id,
    t.model AS truck_model,
    t.year  AS truck_year
FROM sensors s
LEFT JOIN trucks t ON s.truck_id = t.truck_id
ORDER BY s.sensor_id;