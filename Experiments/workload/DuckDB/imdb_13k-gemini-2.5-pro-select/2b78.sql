WITH t_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')),
     mi1_filtered AS
  (SELECT mi.movie_id
   FROM movie_info AS mi
   JOIN info_type AS it ON mi.info_type_id = it.id
   WHERE it.id IN ('17')
     AND mi.info IN ('One of over 700 Paramount Productions, filmed between 1929 and 1949, which were sold to MCA/Universal in 1958 for television distribution, and have been owned and controlled by Universal ever since.')),
     mi2_filtered AS
  (SELECT mi.movie_id
   FROM movie_info AS mi
   JOIN info_type AS it ON mi.info_type_id = it.id
   WHERE it.id IN ('8')
     AND mi.info IN ('USA')),
     mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword AS mk
   JOIN keyword AS k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('blood',
                     'character-name-in-title',
                     'doctor',
                     'father-daughter-relationship',
                     'father-son-relationship',
                     'kidnapping',
                     'lesbian-sex',
                     'love',
                     'marriage',
                     'mother-son-relationship',
                     'new-york-city',
                     'tv-mini-series')),
     ci_filtered AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   JOIN name AS n ON ci.person_id = n.id
   WHERE rt.role IN ('costume designer',
                   'production designer')
     AND (n.gender IN ('f')
          OR n.gender IS NULL))
SELECT COUNT(*)
FROM t_filtered t
JOIN mi1_filtered mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered mi2 ON t.id = mi2.movie_id
JOIN mk_filtered mk ON t.id = mk.movie_id
JOIN ci_filtered ci ON t.id = ci.movie_id;