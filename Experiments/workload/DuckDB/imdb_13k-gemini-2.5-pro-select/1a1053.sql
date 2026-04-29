WITH movies_with_info AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN movie_info AS mi2 ON mi1.movie_id = mi2.movie_id
   WHERE mi1.info_type_id = '3'
     AND mi1.info IN ('Action',
                   'Comedy',
                   'Fantasy',
                   'Horror')
     AND mi2.info_type_id = '7'
     AND mi2.info IN ('PCS:Digital Intermediate',
                   'PFM:35 mm',
                   'RAT:1.33 : 1',
                   'RAT:1.78 : 1 / (high definition)'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movies_with_info AS mwi ON t.id = mwi.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE t.production_year BETWEEN 2000 + 1 AND 2010
  AND kt.kind IN ('episode',
                  'movie',
                  'video movie')
  AND n.gender IN ('f',
                   'm')
  AND rt.role IN ('director',
                  'production designer');