
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
     AND kt.kind IN ('tv series',
                   'video game',
                   'video movie')
     AND k.keyword IN ('bare-chested-male',
                     'blood',
                     'father-daughter-relationship',
                     'father-son-relationship',
                     'flashback',
                     'gay',
                     'gun',
                     'hardcore',
                     'husband-wife-relationship',
                     'jealousy',
                     'lesbian-sex',
                     'mother-daughter-relationship',
                     'mother-son-relationship',
                     'new-york-city',
                     'nudity',
                     'number-in-title',
                     'sequel',
                     'song',
                     'tv-mini-series')
     AND n.gender IN ('f')
     AND rt.role IN ('cinematographer',
                   'editor')
     AND ((mi.info_type_id IN ('6')
           AND mi.info IN ('Mono',
                    'Silent'))
          OR (mi.info_type_id IN ('8')
              AND mi.info IN ('France',
                    'India',
                    'Italy')))
   GROUP BY t.id
   HAVING COUNT(DISTINCT CASE
                             WHEN mi.info_type_id IN ('6') THEN mi.info_type_id
                             ELSE NULL
                         END) >= 1
   AND COUNT(DISTINCT CASE
                          WHEN mi.info_type_id IN ('8') THEN mi.info_type_id
                          ELSE NULL
                      END) >= 1) AS RESULT;