-- Advanced SQL Lesson 2: Fans
-- In this lesson, we  rank country origins of bands, ordered by the number of (non-unique) fans
-- This merely counts the number of fans for each band, and then groups them by origin
SELECT origin,
	SUM(fans) AS nb_fans
FROM metal_bands
WHERE fans IS NOT NULL
GROUP BY origin
ORDER BY nb_fans DESC;
