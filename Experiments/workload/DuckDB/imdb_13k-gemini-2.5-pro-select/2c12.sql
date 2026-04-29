WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1950 AND 1990
     AND title IN ('(#1.279)',
                   '(#1.34)',
                   '(#1.376)',
                   '(#1.597)',
                   '(#1.600)',
                   '(#1.767)',
                   '(#1.942)',
                   '(#7.14)',
                   'Assault',
                   'Bait',
                   'Basket Case',
                   'Big Daddy',
                   'Childhoods End',
                   'Climax',
                   'Cry-Baby',
                   'Faces',
                   'Future-Kill',
                   'Hook, Line and Sinker',
                   'I Do, I Do',
                   'Inferno',
                   'Its Your Move',
                   'Night Patrol',
                   'Please Believe Me',
                   'Superman II',
                   'The Bracelet',
                   'Tug of War',
                   'Working Girl',
                   'Zhizn Klima Samgina')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv series',
                   'video game'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'director'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('6')
  AND mi2.info_type_id IN ('3')
  AND mi1.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'Dolby Digital',
                    'Dolby SR',
                    'Dolby',
                    'Mono')
  AND mi2.info IN ('Comedy',
                    'Crime',
                    'Drama',
                    'Family',
                    'Musical',
                    'Sci-Fi',
                    'Thriller',
                    'Western');