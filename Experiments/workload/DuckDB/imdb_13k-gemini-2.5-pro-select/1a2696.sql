WITH movie_ids AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
SELECT COUNT(*)
FROM movie_ids
JOIN cast_info AS ci ON movie_ids.id = ci.movie_id
JOIN movie_info AS mi1 ON movie_ids.id = mi1.movie_id
JOIN movie_info AS mi2 ON movie_ids.id = mi2.movie_id
WHERE ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('composer',
                   'writer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('18')
  AND mi1.info IN ('Bahamas',
                    'Bellevue Hospital - 550 First Avenue, Manhattan, New York City, New York, USA',
                    'Bray Studios, Down Place, Oakley Green, Berkshire, England, UK',
                    'Chicago, Illinois, USA',
                    'Colonial Street, Backlot, Universal Studios - 100 Universal City Plaza, Universal City, California, USA',
                    'England, UK',
                    'Hong Kong, China',
                    'Malibu, California, USA',
                    'Miami, Florida, USA',
                    'Spain',
                    'Sydney, New South Wales, Australia')
  AND mi2.info_type_id IN ('17')
  AND mi2.info IN ('Last show of the series.');