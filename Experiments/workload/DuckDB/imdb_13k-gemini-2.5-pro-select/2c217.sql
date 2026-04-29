WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND t.title IN ('12',
                   'Entente Cordiale',
                   'Inheritance',
                   'Inside Job',
                   'Limbo',
                   'Masquerade',
                   'Nineteen Eighty-Four',
                   'The Final Sanction',
                   'The Road to War',
                   'The Skin of Our Teeth',
                   'Timewatch')
     AND kt.kind IN ('movie',
                   'tv movie',
                   'video game',
                   'video movie'))
SELECT COUNT(*)
FROM filtered_movies AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE n.gender IN ('f',
                    'm')
  AND rt.role IN ('actress',
                   'producer')
  AND it1.id IN ('1')
  AND mi1.info IN ('102',
                    '79',
                    '80',
                    '96',
                    '97',
                    '98',
                    'Argentina:30',
                    'Argentina:60',
                    'USA:25',
                    'USA:60')
  AND it2.id IN ('6')
  AND mi2.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'Dolby',
                    'Mono',
                    'Silent',
                    'Stereo');