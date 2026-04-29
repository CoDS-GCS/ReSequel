
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv movie',
                   'tv series',
                   'video game'))
  AND mi1.info_type_id IN ('7')
  AND mi1.info IN ('PCS:Spherical',
                    'PFM:35 mm',
                    'RAT:1.78 : 1 / (high definition)',
                    'RAT:1.85 : 1')
  AND mi2.info_type_id IN ('8')
  AND mi2.info IN ('Belgium',
                    'Canada',
                    'India',
                    'Japan',
                    'UK')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('cinematographer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('bare-breasts',
                     'father-daughter-relationship',
                     'father-son-relationship',
                     'oral-sex',
                     'suicide'));