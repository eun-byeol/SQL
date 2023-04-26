WITH RECURSIVE tmp AS (
    SELECT 0 AS rnum
    UNION ALL
    SELECT rnum + 1 FROM tmp
    WHERE rnum < 23
)

SELECT rnum AS RNUM, IF (a.count IS NULL, 0, a.count) AS count
FROM tmp AS t
LEFT JOIN (
    SELECT HOUR(datetime) AS hour, count(*) AS count
    FROM animal_outs
    GROUP BY HOUR(datetime)
) AS a
ON t.rnum = a.hour
ORDER BY 1
