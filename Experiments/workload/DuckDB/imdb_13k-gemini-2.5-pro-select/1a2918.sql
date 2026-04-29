
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'composer',
                   'director',
                   'producer',
                   'writer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('8')
  AND mi1.info IN ('Austria',
                    'Germany',
                    'Greece',
                    'India',
                    'Netherlands',
                    'New Zealand',
                    'Norway',
                    'Soviet Union')
  AND mi2.info_type_id IN ('5')
  AND mi2.info IN ('Australia:G',
                    'Germany:o.Al.',
                    'Iceland:12',
                    'Netherlands:16',
                    'New Zealand:M',
                    'Norway:16',
                    'Philippines:G',
                    'Singapore:R21',
                    'USA:R',
                    'USA:X');