 
 
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1950 AND 1990
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv series',
                   'video game',
                   'video movie'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f',
                    'm'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('miscellaneous crew',
                   'producer'))
  AND mi1.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('7'))
  AND mi1.info IN ('PCS:Spherical',
                    'PFM:16 mm',
                    'PFM:35 mm',
                    'RAT:1.33 : 1',
                    'RAT:1.66 : 1',
                    'RAT:1.85 : 1')
  AND mi2.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('3'))
  AND mi2.info IN ('Adult',
                    'Comedy',
                    'Documentary',
                    'Drama',
                    'Mystery',
                    'Romance',
                    'Short',
                    'Thriller',
                    'Western');