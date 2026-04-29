WITH t_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1990 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'video movie'))
SELECT COUNT(*)
FROM t_filtered
JOIN movie_info AS mi1 ON t_filtered.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t_filtered.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t_filtered.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t_filtered.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE it1.id IN ('5')
  AND mi1.info IN ('Australia:PG',
                    'Germany:12',
                    'Peru:14',
                    'USA:TV-PG')
  AND it2.id IN ('6')
  AND mi2.info IN ('Dolby Digital',
                    'Dolby',
                    'SDDS')
  AND rt.role IN ('composer')
  AND n.gender IS NULL
  AND k.keyword IN ('bare-breasts',
                     'based-on-novel',
                     'based-on-play',
                     'blood',
                     'character-name-in-title',
                     'doctor',
                     'father-son-relationship',
                     'female-frontal-nudity',
                     'gun',
                     'husband-wife-relationship',
                     'male-nudity',
                     'non-fiction',
                     'nudity',
                     'party',
                     'sex');