WITH mi_filtered AS
  (SELECT mi1.movie_id
   FROM
     (SELECT movie_id,
             info_type_id,
             info
      FROM movie_info
      WHERE info_type_id IN ('7')
        AND info IN ('OFM:35 mm',
                    'OFM:Video',
                    'PFM:35 mm',
                    'PFM:Video',
                    'RAT:1.78 : 1')) AS mi1
   JOIN
     (SELECT movie_id,
             info_type_id,
             info
      FROM movie_info
      WHERE info_type_id IN ('1')
        AND info IN ('30',
                    '43',
                    '60',
                    '93',
                    '94')) AS mi2 ON mi1.movie_id = mi2.movie_id)
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN mi_filtered ON t.id = mi_filtered.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND rt.role IN ('composer')
  AND n.gender IS NULL
  AND k.keyword IN ('character-name-in-title',
                     'hospital',
                     'male-frontal-nudity',
                     'mother-daughter-relationship',
                     'mother-son-relationship',
                     'murder',
                     'nudity',
                     'one-word-title',
                     'revenge',
                     'suicide');