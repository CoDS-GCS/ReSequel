WITH movie_ids AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 1975
     AND kt.kind IN ('tv series',
                   'video game'))
SELECT COUNT(*)
FROM movie_ids
JOIN cast_info AS ci ON movie_ids.id = ci.movie_id
JOIN movie_info AS mi1 ON movie_ids.id = mi1.movie_id
JOIN movie_info AS mi2 ON movie_ids.id = mi2.movie_id
WHERE ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'cinematographer',
                   'miscellaneous crew',
                   'production designer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f',
                    'm')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('7')
  AND mi1.info IN ('CAM:Arriflex Cameras',
                    'LAB:DeLuxe, USA',
                    'LAB:Tecnostampa, Roma, Italy',
                    'OFM:Live',
                    'PCS:SuperScope',
                    'PFM:16 mm',
                    'RAT:1.33 : 1',
                    'RAT:1.66 : 1')
  AND mi2.info_type_id IN ('16')
  AND mi2.info IN ('USA:1954',
                    'USA:1955',
                    'USA:1956',
                    'USA:1957',
                    'USA:1959',
                    'USA:1960');