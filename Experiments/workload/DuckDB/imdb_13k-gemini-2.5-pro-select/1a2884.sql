
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1950 AND 1990
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('video game',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('director',
                   'editor'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('3')
  AND mi1.info IN ('Adventure',
                    'Animation',
                    'Comedy',
                    'Documentary',
                    'Film-Noir',
                    'History',
                    'Musical',
                    'Sci-Fi',
                    'Sport',
                    'War',
                    'Western')
  AND mi2.info_type_id IN ('5')
  AND mi2.info IN ('Argentina:Atp',
                    'Australia:R',
                    'Canada:18+',
                    'Finland:(Banned)',
                    'Finland:S',
                    'France:-12',
                    'Iceland:16',
                    'New Zealand:R18',
                    'Singapore:NC-16',
                    'UK:15',
                    'West Germany:o.Al.');