
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1950 + 1 AND 1990
  AND kt.kind IN ('tv series',
                  'video game',
                  'video movie')
  AND mi1.info_type_id = '3'
  AND mi1.info IN ('Adult',
                   'Animation',
                   'Biography',
                   'Comedy',
                   'Drama',
                   'Fantasy',
                   'Romance',
                   'Short',
                   'Thriller')
  AND mi2.info_type_id = '7'
  AND mi2.info IN ('OFM:16 mm',
                   'OFM:35 mm',
                   'PCS:Panavision',
                   'PCS:Spherical',
                   'PFM:16 mm',
                   'PFM:35 mm',
                   'PFM:Video',
                   'RAT:1.33 : 1',
                   'RAT:1.37 : 1',
                   'RAT:2.35 : 1')
  AND rt.role IN ('actress')
  AND n.gender IN ('f');