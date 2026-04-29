 
 
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('episode',
                  'movie',
                  'tv movie')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id = '3'
AND mi1.info IN ('Adventure',
                   'Biography',
                   'Drama',
                   'Fantasy',
                   'History',
                   'Romance',
                   'Short',
                   'Sport',
                   'Thriller')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info_type_id = '7'
AND mi2.info IN ('MET:',
                   'MET:15.24 m',
                   'MET:30 m',
                   'OFM:35 mm',
                   'PCS:Spherical',
                   'PFM:35 mm',
                   'PFM:68 mm',
                   'RAT:1.20 : 1',
                   'RAT:1.33 : 1',
                   'RAT:2.35 : 1')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('writer')
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('f')
WHERE t.production_year <= 1975
  AND t.production_year > 1875;