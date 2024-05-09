WITH RECURSIVE grand_tour (point1, point2, visited, total_cost, cities_count) AS (
    SELECT point1, point2, ARRAY[point1, point2], cost, 1
    FROM point_cost
    WHERE point1 = 'a'

    UNION ALL

    SELECT pc.point1, pc.point2, array_append(gt.visited, pc.point2), gt.total_cost + pc.cost, gt.cities_count + 1
    FROM point_cost AS pc
    JOIN grand_tour AS gt ON gt.point2 = pc.point1
    WHERE NOT pc.point2 = ANY (gt.visited)
      AND gt.cities_count < 4
),

completed_tours AS (
    SELECT gt.total_cost + pc.cost AS total_cost, array_to_string(array_append(gt.visited, 'a'), ',') AS tour
    FROM grand_tour AS gt
    JOIN point_cost AS pc ON gt.point2 = pc.point2 AND pc.point1 = 'a'
    WHERE gt.cities_count = 3
)

SELECT total_cost, tour
FROM completed_tours
-- WHERE total_cost = (SELECT MIN(total_cost) FROM completed_tours)
ORDER BY total_cost, tour;