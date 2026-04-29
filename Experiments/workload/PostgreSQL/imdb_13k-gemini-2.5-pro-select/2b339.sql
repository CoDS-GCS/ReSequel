
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year >= 1925
     AND t.production_year <= 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'video movie')) AS t_filtered
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('5')
     AND info IN ('Iceland:12',
                    'Iceland:16',
                    'Iceland:L',
                    'Netherlands:16',
                    'Sweden:15')) AS mi1_filtered ON t_filtered.id = mi1_filtered.movie_id
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('7')
     AND info IN ('OFM:35 mm',
                    'PCS:Spherical',
                    'RAT:1.85 : 1',
                    'RAT:2.35 : 1')) AS mi2_filtered ON t_filtered.id = mi2_filtered.movie_id
JOIN
  (SELECT mk.movie_id
   FROM movie_keyword AS mk
   JOIN keyword AS k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('blood',
                     'death',
                     'dog',
                     'father-daughter-relationship',
                     'father-son-relationship',
                     'gay',
                     'husband-wife-relationship',
                     'nudity',
                     'one-word-title',
                     'sex',
                     'tv-mini-series')) AS mk_filtered ON t_filtered.id = mk_filtered.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IS NULL
     AND rt.role IN ('costume designer')) AS ci_filtered ON t_filtered.id = ci_filtered.movie_id;