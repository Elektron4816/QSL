CREATE TABLE nodes (
    point1 char NOT NULL,
    point2 char NOT NULL,
    cost   int  NOT NULL
);

INSERT INTO nodes (point1, point2, cost)
VALUES ('a', 'b', 10),
       ('b', 'a', 10),
       ('a', 'c', 15),
       ('c', 'a', 15),
       ('c', 'b', 35),
       ('b', 'c', 35),
       ('a', 'd', 20),
       ('d', 'a', 20),
       ('c', 'd', 30),
       ('d', 'c', 30),
       ('d', 'b', 25),
       ('b', 'd', 25);

CREATE VIEW v_any_ways AS (
WITH RECURSIVE any_ways AS (
    SELECT point1::bpchar AS way, point1, point2, cost AS sum
    FROM nodes
    WHERE point1 = 'a'
    UNION 
    SELECT any_ways.way || ',' || nodes.point1, nodes.point1, nodes.point2, any_ways.sum + nodes.cost AS sum
    FROM any_ways
    JOIN nodes ON any_ways.point2 = nodes.point1
    WHERE way NOT LIKE '%' || nodes.point1 || '%'
)
SELECT *
FROM any_ways);

SELECT sum AS total_cost, '{' || way || ',' || point2 || '}' as tour
FROM v_any_ways
WHERE length(way) = 7 AND point2 = 'a' AND sum = (select min(sum)
                                FROM v_any_ways
                                where length(way) = 7 AND point2 = 'a')
ORDER BY 1,2;