-- Cek table
SELECT
	*
FROM netflix_titles nt;

-- Cek jumlah data
SELECT
  COUNT(*)
FROM netflix_titles nt ;

-- Cek duplikat
SELECT
  show_id,
  COUNT(*)
FROM netflix_titles nt 
GROUP BY 1
ORDER BY 1 DESC;

-- Cek null value
SELECT 
  SUM(show_id IS NULL OR show_id = '') AS showid_nulls,
  SUM(type IS NULL OR type = '') AS type_nulls,
  SUM(title IS NULL OR title = '') AS title_nulls,
  SUM(director IS NULL OR director = '') AS director_nulls,
  SUM(`cast` IS NULL OR cast = '') AS cast_nulls,
  SUM(country IS NULL OR country = '') AS country_nulls,
  SUM(date_added IS NULL OR date_added = '') AS date_added_nulls,
  SUM(release_year IS NULL) AS release_year_nulls,
  SUM(rating IS NULL OR rating = '') AS rating_nulls,
  SUM(duration IS NULL OR duration = '') AS duration_nulls,
  SUM(listed_in IS NULL OR listed_in = '') AS listed_in_nulls,
  SUM(description IS NULL OR description = '') AS description_nulls
FROM netflix_titles nt;

-- Handling missing values
UPDATE netflix_titles nt
SET director = 'Not Given'
WHERE director IS NULL OR director = '';

WITH country_mapping AS (
  SELECT 
    director, 
    country,
    ROW_NUMBER() OVER(PARTITION BY director ORDER BY COUNT(*) DESC) as rn
  FROM netflix_titles
  WHERE director IS NOT NULL AND director != '' AND director != 'Not Given'
    AND country IS NOT NULL AND country != ''
  GROUP BY director, country
)
UPDATE netflix_titles n
JOIN country_mapping m ON n.director = m.director
SET n.country = m.country
WHERE m.rn = 1 
  AND (n.country IS NULL OR n.country = '');

UPDATE netflix_titles 
SET country = 'Unknown Country' 
WHERE country IS NULL OR country = '';

UPDATE netflix_titles
SET `cast` = CASE 
    WHEN listed_in LIKE '%Documentaries%' THEN 'Documentary / No Cast'
    ELSE 'Unknown Cast'
END
WHERE `cast` IS NULL OR `cast` = '';

SELECT show_id, title, rating, duration 
FROM netflix_titles 
WHERE rating IS NULL OR rating = '';

UPDATE netflix_titles
SET 
  duration = rating,   
  rating = 'NR'       
WHERE duration IS NULL OR duration = '';

UPDATE netflix_titles
SET    
  rating = 'NR'       
WHERE rating IS NULL OR rating = '';

DELETE FROM netflix_titles 
WHERE date_added IS NULL OR date_added = '';

-- Hapus kolom description (tidak terlalu penting)
ALTER TABLE netflix_titles
DROP COLUMN description;

-- Mengambil country pertama jika country lebih dari 1
SELECT 
  title,
  country_main
FROM netflix_titles;

ALTER TABLE netflix_titles 
ADD country_main VARCHAR(255);

UPDATE netflix_titles 
SET country_main = SUBSTRING_INDEX(country, ',', 1)
WHERE country IS NOT NULL AND country != '';

-- DROP table country lama dan ganti dengan table country baru
ALTER TABLE netflix_titles
DROP COLUMN country;

ALTER TABLE netflix_titles 
RENAME COLUMN country_main TO country;

-- Final Check
SELECT
	*
FROM netflix_titles nt;