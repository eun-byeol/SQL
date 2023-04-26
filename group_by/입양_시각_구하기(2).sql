WITH RECURSIVE time AS (
    SELECT 0 AS hour
    UNION ALL
    SELECT hour + 1 FROM time
    WHERE hour < 23
)

SELECT t.hour, COUNT(a.datetime) AS COUNT
FROM time AS t
LEFT JOIN animal_outs AS a
ON t.hour = HOUR(a.datetime)
GROUP BY t.hour
ORDER BY 1
