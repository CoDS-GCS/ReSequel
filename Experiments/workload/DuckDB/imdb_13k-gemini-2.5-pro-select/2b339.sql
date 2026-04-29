WITH t_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year >= 1925
     AND t.production_year <= 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'video movie')),
     mi_combined AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN movie_info AS mi2 ON mi1.movie_id = mi2.movie_id
   WHERE mi1.info_type_id IN ('5')
     AND mi1.info IN ('Iceland:12',
                    'Iceland:16',
                    'Iceland:L',
                    'Netherlands:16',
                    'Sweden:15')
     AND mi2.info_type_id IN ('7')
     AND mi2.info IN ('OFM:35 mm',
                    'PCS:Spherical',
                    'RAT:1.85 : 1',
                    'RAT:2.35 : 1')),
     mk_filtered AS
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
                     'tv-mini-series')),
     ci_filtered AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IS NULL
     AND rt.role IN ('costume designer'))
SELECT COUNT(*)
FROM t_filtered t
JOIN mi_combined mi ON t.id = mi.movie_id
JOIN mk_filtered mk ON t.id = mk.movie_id
JOIN ci_filtered ci ON t.id = ci.movie_id;