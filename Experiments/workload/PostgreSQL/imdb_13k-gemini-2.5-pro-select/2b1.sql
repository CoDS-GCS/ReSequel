
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_keyword AS mk ON t.id = mk.movie_id
   JOIN keyword AS k ON mk.keyword_id = k.id
   JOIN cast_info AS ci ON t.id = ci.movie_id
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   JOIN movie_info AS mi ON t.id = mi.movie_id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
     AND k.keyword IN ('air-attack',
                     'ancient-computer',
                     'baby-urinating',
                     'botswana-south-africa',
                     'cilantro',
                     'g-string',
                     'jorge-drexler',
                     'kameido-tokyo',
                     'late-riser',
                     'ltr',
                     'porno-theatre',
                     'reference-to-otis-blackwell',
                     'robot-airplane',
                     'room-with-a-view',
                     'skeleton',
                     'tinder',
                     'underwater-scene',
                     'wet-back')
     AND n.gender IN ('f')
     AND rt.role IN ('cinematographer',
                   'writer')
     AND ((mi.info_type_id IN ('6')
           AND mi.info IN ('Mono',
                    'Silent'))
          OR (mi.info_type_id IN ('2')
              AND mi.info IN ('Color')))
   GROUP BY t.id
   HAVING COUNT(DISTINCT CASE
                             WHEN mi.info_type_id IN ('6') THEN mi.info_type_id
                             ELSE NULL
                         END) >= 1
   AND COUNT(DISTINCT CASE
                          WHEN mi.info_type_id IN ('2') THEN mi.info_type_id
                          ELSE NULL
                      END) >= 1) AS RESULT;