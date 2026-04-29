
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
   WHERE t.production_year BETWEEN 1925 AND 2015
     AND kt.kind IN ('tv movie',
                   'video game')
     AND k.keyword IN ('chewing',
                     'coffin',
                     'folk-singing-group',
                     'futon',
                     'gardelegen',
                     'heart-and-soul',
                     'hidden-treasure',
                     'jeans-shop',
                     'kicked-through-a-window',
                     'operation-frankton',
                     'philippines-liberation',
                     'reference-to-breakfast-at-tiffanys-the-novel',
                     'reference-to-luther-vandross',
                     'reference-to-will-rogers',
                     'roadside-stand',
                     'royal-courtier',
                     'sex-between-old-couple',
                     'shredding-machine')
     AND n.gender IN ('f')
     AND rt.role IN ('writer')
     AND ((mi.info_type_id IN ('8')
           AND mi.info IN ('Germany',
                    'UK',
                    'USA'))
          OR (mi.info_type_id IN ('1')
              AND mi.info IN ('100',
                    '17',
                    '21',
                    '30',
                    '6',
                    '83',
                    '93',
                    'Germany:24',
                    'UK:60',
                    'USA:120',
                    'USA:16',
                    'USA:20',
                    'USA:3',
                    'USA:60')))
   GROUP BY t.id
   HAVING COUNT(DISTINCT CASE
                             WHEN mi.info_type_id IN ('8') THEN mi.info_type_id
                             ELSE NULL
                         END) >= 1
   AND COUNT(DISTINCT CASE
                          WHEN mi.info_type_id IN ('1') THEN mi.info_type_id
                          ELSE NULL
                      END) >= 1) AS RESULT;