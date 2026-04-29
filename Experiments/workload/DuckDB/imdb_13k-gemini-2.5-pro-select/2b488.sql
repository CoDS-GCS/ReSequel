
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND mi1.info IN ('OFM:35 mm',
                    'OFM:Video',
                    'PFM:35 mm',
                    'PFM:Video',
                    'RAT:1.78 : 1')
  AND mi2.info IN ('30',
                    '43',
                    '60',
                    '93',
                    '94')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv movie',
                   'tv series',
                   'video game'))
  AND mi1.info_type_id IN ('7')
  AND mi2.info_type_id IN ('1')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('composer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IS NULL)
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('character-name-in-title',
                     'hospital',
                     'male-frontal-nudity',
                     'mother-daughter-relationship',
                     'mother-son-relationship',
                     'murder',
                     'nudity',
                     'one-word-title',
                     'revenge',
                     'suicide'));