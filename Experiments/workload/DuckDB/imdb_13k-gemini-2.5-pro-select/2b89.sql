WITH t_filtered AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND kt.kind IN ('movie',
                   'tv movie')),
     mi1_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('4')
     AND mi.info IN ('Dutch',
                    'English',
                    'German')),
     mi2_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('5')
     AND mi.info IN ('Australia:PG',
                    'Belgium:KT',
                    'Canada:PG',
                    'Finland:K-16',
                    'Finland:S',
                    'Sweden:Btl',
                    'UK:PG',
                    'USA:Approved',
                    'USA:Passed',
                    'USA:R',
                    'West Germany:12',
                    'West Germany:16')),
     ci_filtered AS
  (SELECT ci.movie_id
   FROM cast_info ci
   JOIN role_type rt ON ci.role_id = rt.id
   JOIN name n ON ci.person_id = n.id
   WHERE rt.role IN ('actress')
     AND n.gender IN ('m')),
     mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('anal-sex',
                     'based-on-novel',
                     'death',
                     'gun',
                     'hardcore',
                     'homosexual',
                     'hospital',
                     'husband-wife-relationship',
                     'lesbian-sex',
                     'marriage',
                     'number-in-title',
                     'oral-sex',
                     'singing',
                     'suicide'))
SELECT COUNT(*)
FROM t_filtered t
JOIN mi1_filtered mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered mi2 ON t.id = mi2.movie_id
JOIN ci_filtered ci ON t.id = ci.movie_id
JOIN mk_filtered mk ON t.id = mk.movie_id;