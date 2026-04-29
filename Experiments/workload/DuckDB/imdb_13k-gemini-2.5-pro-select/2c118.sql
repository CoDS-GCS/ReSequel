WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1875 AND 1975
     AND title IN ('(#1.111)',
                   '(#1.15)',
                   '(#2.21)',
                   '(#3.26)',
                   'AFL-NFL World Championship Game',
                   'Anna',
                   'By the Book',
                   'Doctors Wives',
                   'It Started with Eve',
                   'Quinta puntata',
                   'Ricochet',
                   'Song of Russia',
                   'Terror',
                   'The Dark Angel',
                   'The FBI Story',
                   'The Gold Rush',
                   'The Guiding Light',
                   'The Outcast',
                   'The Undercover Man',
                   'Under Suspicion')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv series',
                   'video game',
                   'video movie'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('cinematographer',
                   'composer',
                   'director',
                   'guest',
                   'writer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('8')
  AND mi2.info_type_id IN ('6')
  AND mi1.info IN ('Belgium',
                    'East Germany',
                    'Japan',
                    'Philippines',
                    'Spain',
                    'Sweden',
                    'Switzerland',
                    'UK')
  AND mi2.info IN ('Mono',
                    'Silent',
                    'Stereo');