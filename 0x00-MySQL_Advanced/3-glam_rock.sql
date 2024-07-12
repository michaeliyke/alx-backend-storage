-- Advanced SQL Lesson 3: Glam Rock
-- Lists all bands with Glam rock as their main style, ranked by their longevity
SELECT band_name,
	ABS(split - formed) AS lifespan
FROM metal_bands
WHERE style LIKE '%Glam rock%'
	AND split <= 2022
ORDER BY lifespan DESC;
