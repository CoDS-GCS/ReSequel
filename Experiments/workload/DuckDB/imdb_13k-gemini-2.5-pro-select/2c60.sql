WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 2015
     AND title IN ('(#1.410)',
                   '(#2.123)',
                   '(#27.4)',
                   '(#9.64)',
                   'Bringing Out the Dead',
                   'Confession',
                   'Eleven',
                   'Home: Part 2',
                   'Le divorce',
                   'Louisiana',
                   'The Paragon Cortex')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
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
   WHERE ROLE IN ('editor',
                   'miscellaneous crew'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('8')
  AND mi2.info_type_id IN ('2')
  AND mi1.info IN ('Bulgaria',
                    'Cuba',
                    'Czech Republic',
                    'Hungary',
                    'Indonesia',
                    'Venezuela',
                    'Yugoslavia')
  AND mi2.info IN ('Black and White',
                    'Color');