WITH t_filtered AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND kt.kind IN ('tv series',
                   'video game'))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE mi1.info_type_id IN ('1')
  AND mi1.info IN ('11',
                    '15',
                    '25',
                    '50',
                    '65',
                    '75',
                    '8',
                    '80',
                    '9',
                    '90',
                    'USA:7',
                    'USA:70')
  AND mi2.info_type_id IN ('8')
  AND mi2.info IN ('USA')
  AND n.gender IN ('m')
  AND rt.role IN ('costume designer',
                   'editor')
  AND k.keyword IN ('bare-breasts',
                     'based-on-play',
                     'flashback',
                     'friendship',
                     'hospital',
                     'independent-film',
                     'lesbian',
                     'male-nudity',
                     'marriage',
                     'mother-daughter-relationship',
                     'number-in-title',
                     'one-word-title',
                     'revenge');