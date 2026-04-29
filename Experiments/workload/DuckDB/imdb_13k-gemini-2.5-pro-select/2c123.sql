WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND t.title IN ('(#1.101)',
                   '(#3.8)',
                   '(#4.19)',
                   '(#4.21)',
                   '(#4.29)',
                   'Blazing Saddles',
                   'David Copperfield',
                   'Flying Down to Rio',
                   'Inside Job',
                   'Nana',
                   'Navy Blues',
                   'North to Alaska',
                   'Pittsburgh',
                   'Ramona',
                   'Scared Stiff',
                   'The Actress',
                   'The Message',
                   'The Monkeys Paw',
                   'The Other Man',
                   'The Road Back',
                   'The Tell-Tale Heart',
                   'The Tiger')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
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
WHERE n.gender IN ('m')
  AND rt.role IN ('composer')
  AND it1.id IN ('6')
  AND mi1.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'Cinephone',
                    'De Forest Phonofilm',
                    'Dolby Digital',
                    'Mono',
                    'Silent',
                    'Stereo',
                    'Vitaphone')
  AND it2.id IN ('7')
  AND mi2.info IN ('LAB:Technicolor',
                    'LAB:Technicolor, USA',
                    'MET:300 m',
                    'MET:600 m',
                    'OFM:16 mm',
                    'PCS:Spherical',
                    'PCS:Techniscope',
                    'RAT:1.66 : 1',
                    'RAT:2.35 : 1');