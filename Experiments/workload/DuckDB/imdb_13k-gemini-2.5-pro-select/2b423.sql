
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
     AND k.keyword IN ('announcing-entrance',
                     'being-present',
                     'blancmange',
                     'boat-designer',
                     'fossil-bone',
                     'hand-injury',
                     'injured-horse',
                     'irrigation-ditch',
                     'police-film',
                     'reference-to-clive-gillinson',
                     'shakespeares-the-tempest',
                     'st.-pauli',
                     'stolen-gem',
                     'turning-into-a-hawke',
                     'underwater-fellatio',
                     'woman-hits-a-man',
                     'wystan-hugh-auden-quotation')
     AND n.gender IN ('f',
                    'm')
     AND rt.role IN ('costume designer',
                   'production designer')
     AND ((mi.info_type_id IN ('4')
           AND mi.info IN ('Finnish',
                    'German',
                    'Greek',
                    'Japanese',
                    'Mandarin',
                    'Portuguese',
                    'Spanish'))
          OR (mi.info_type_id IN ('3')
              AND mi.info IN ('Animation',
                    'Comedy',
                    'Drama',
                    'Music',
                    'Romance',
                    'Short')))
   GROUP BY t.id
   HAVING COUNT(DISTINCT CASE
                             WHEN mi.info_type_id IN ('4') THEN mi.info_type_id
                             ELSE NULL
                         END) >= 1
   AND COUNT(DISTINCT CASE
                          WHEN mi.info_type_id IN ('3') THEN mi.info_type_id
                          ELSE NULL
                      END) >= 1) AS RESULT;