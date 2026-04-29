WITH mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('acid-house',
                     'age-verification',
                     'axe-in-the-head',
                     'dentist',
                     'falling-to-death',
                     'godzilla-junior',
                     'hiding-under-a-desk',
                     'hit-by-a-fire-engine',
                     'honor-court',
                     'horse-costume',
                     'mother-deliverying-own-baby',
                     'nst',
                     'poisonous-snake-bite',
                     'posing-for-portrait',
                     'reference-to-hannah-montana',
                     'science-show',
                     'throwing-a-book',
                     'veterinarian',
                     'veterinary-surgeon',
                     'wild-chicken',
                     'woman-played-by-a-man'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN mk_filtered AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1950 AND 2010
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND it1.id IN ('1')
  AND mi1.info IN ('107',
                    '15',
                    '19',
                    '70',
                    '77',
                    '78',
                    '95',
                    'USA:17',
                    'USA:48',
                    'USA:78',
                    'USA:87',
                    'USA:88',
                    'USA:93')
  AND it2.id IN ('4')
  AND mi2.info IN ('English',
                    'French',
                    'Spanish')
  AND rt.role IN ('actor')
  AND n.gender IN ('m');