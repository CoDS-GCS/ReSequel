
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1925 AND 1975
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('cinematographer',
                   'miscellaneous crew',
                   'producer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('1')
  AND mi1.info IN ('106',
                    '11',
                    '12',
                    '45',
                    '61',
                    '62',
                    '8',
                    '80',
                    '81',
                    '85',
                    '89',
                    '94',
                    '95',
                    '97',
                    'USA:18')
  AND mi2.info_type_id IN ('4')
  AND mi2.info IN ('Czech',
                    'Dutch',
                    'Finnish',
                    'German',
                    'Greek',
                    'Hindi',
                    'Italian',
                    'Korean',
                    'Mandarin',
                    'None',
                    'Polish',
                    'Russian',
                    'Spanish',
                    'Swedish',
                    'Turkish');