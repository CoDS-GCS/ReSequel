WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1875 AND 1975
     AND title IN ('(#1.101)',
                   '(#1.63)',
                   '(#1.65)',
                   '(#2.4)',
                   '(#4.35)',
                   '(#5.1)',
                   'An American in Paris',
                   'Casanova',
                   'Flying Down to Rio',
                   'Manpower',
                   'Maridinho de Luxo',
                   'Mrs. Parkington',
                   'No Escape',
                   'Scandal Sheet',
                   'Search for Tomorrow',
                   'See No Evil',
                   'She',
                   'Snow Job',
                   'Thats the Spirit',
                   'The Final Test',
                   'The Great Caruso',
                   'The Silver Chalice')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('movie',
                   'tv movie',
                   'tv series'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('composer',
                   'costume designer',
                   'editor',
                   'producer',
                   'writer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('17')
  AND mi2.info_type_id IN ('2')
  AND mi1.info IN ('Last show of the series.',
                    'One of over 700 Paramount Productions, filmed between 1929 and 1949, which were sold to MCA/Universal in 1958 for television distribution, and have been owned and controlled by Universal ever since.',
                    'Original French title is undetermined.')
  AND mi2.info IN ('Black and White',
                    'Color');