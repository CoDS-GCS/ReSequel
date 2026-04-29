
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND kt.kind IN ('movie',
                   'tv movie')) AS t_filtered
JOIN
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   WHERE it1.id IN ('3')
     AND mi1.info IN ('Crime',
                    'Drama',
                    'Musical',
                    'Mystery',
                    'Short')) AS mi1_filtered ON t_filtered.id = mi1_filtered.movie_id
JOIN
  (SELECT mi2.movie_id
   FROM movie_info AS mi2
   JOIN info_type AS it2 ON mi2.info_type_id = it2.id
   WHERE it2.id IN ('7')
     AND mi2.info IN ('MET:600 m',
                    'OFM:35 mm',
                    'PCS:Spherical',
                    'PFM:35 mm')) AS mi2_filtered ON t_filtered.id = mi2_filtered.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   JOIN name AS n ON ci.person_id = n.id
   WHERE rt.role IN ('production designer')
     AND n.gender IS NULL) AS ci_filtered ON t_filtered.id = ci_filtered.movie_id
JOIN
  (SELECT mk.movie_id
   FROM movie_keyword AS mk
   JOIN keyword AS k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('bare-chested-male',
                     'based-on-novel',
                     'blood',
                     'death',
                     'family-relationships',
                     'husband-wife-relationship',
                     'murder',
                     'suicide')) AS mk_filtered ON t_filtered.id = mk_filtered.movie_id;