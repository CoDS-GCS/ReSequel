WITH t_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 2015
     AND kt.kind IN ('tv movie',
                   'tv series'))
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
WHERE it1.id IN ('7')
  AND mi1.info IN ('RAT:16:9 HD',
                    'RAT:4:3 Letterbox')
  AND it2.id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color')
  AND rt.role IN ('costume designer')
  AND n.gender IS NULL
  AND k.keyword IN ('bare-breasts',
                     'blood',
                     'dancing',
                     'female-frontal-nudity',
                     'fight',
                     'flashback',
                     'friendship',
                     'gun',
                     'hardcore',
                     'homosexual',
                     'kidnapping',
                     'lesbian',
                     'mother-daughter-relationship',
                     'mother-son-relationship',
                     'revenge',
                     'singer',
                     'violence');