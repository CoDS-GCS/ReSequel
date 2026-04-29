
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'video movie')) AS t_filtered
JOIN
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('17')
     AND mi.info IN ('Last show of the series.')) AS mi1_filtered ON t_filtered.id = mi1_filtered.movie_id
JOIN
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('7')
     AND mi.info IN ('OFM:35 mm',
                    'PFM:35 mm',
                    'RAT:1.33 : 1')) AS mi2_filtered ON t_filtered.id = mi2_filtered.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info ci
   JOIN role_type rt ON ci.role_id = rt.id
   JOIN name n ON ci.person_id = n.id
   WHERE rt.role IN ('actress',
                   'cinematographer')
     AND n.gender IN ('m')) AS ci_filtered ON t_filtered.id = ci_filtered.movie_id
JOIN
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('bare-breasts',
                     'father-son-relationship',
                     'gun',
                     'lesbian',
                     'love',
                     'male-nudity',
                     'marriage',
                     'murder',
                     'nudity')) AS mk_filtered ON t_filtered.id = mk_filtered.movie_id;