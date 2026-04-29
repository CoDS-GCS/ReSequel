WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND t.title IN ('(#1.88)',
                   '(#3.20)',
                   '(#6.12)',
                   '(#7.7)',
                   'Dakota',
                   'Eyewitness',
                   'Help Wanted',
                   'Jailbreak',
                   'The Accident',
                   'The Countess',
                   'The Daring Young Man',
                   'Volpone',
                   'White Heat',
                   'You and Me')
     AND kt.kind IN ('movie',
                   'tv movie',
                   'tv series',
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
  AND rt.role IN ('composer',
                   'editor',
                   'producer')
  AND it1.id IN ('4')
  AND mi1.info IN ('Bulgarian',
                    'Czech',
                    'English',
                    'Filipino',
                    'Finnish',
                    'German',
                    'Japanese',
                    'Korean',
                    'None',
                    'Norwegian',
                    'Polish',
                    'Russian',
                    'Telugu')
  AND it2.id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color');