-- Advanced SQL Lesson 3: Glam Rock
-- Lists all bands with Glam rock as their main style, ranked by their longevity
-- Note, the default split year is 2022 in case it is NULL
SELECT band_name,
	ABS(COALESCE(split, 2022) - formed) AS lifespan
FROM metal_bands
WHERE style LIKE '%Glam rock%'
ORDER BY lifespan DESC,
	band_name DESC;
