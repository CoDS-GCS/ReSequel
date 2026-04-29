
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND kt.kind IN ('tv series',
                   'video game',
                   'video movie')) AS t_filtered
JOIN
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('2')
     AND mi.info IN ('Black and White')) AS mi1_filtered ON t_filtered.id = mi1_filtered.movie_id
JOIN
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('6')
     AND mi.info IN ('Mono',
                    'Silent')) AS mi2_filtered ON t_filtered.id = mi2_filtered.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info ci
   JOIN role_type rt ON ci.role_id = rt.id
   JOIN name n ON ci.person_id = n.id
   WHERE rt.role IN ('cinematographer',
                   'writer')
     AND n.gender IN ('f')) AS ci_filtered ON t_filtered.id = ci_filtered.movie_id
JOIN
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('based-on-novel',
                     'based-on-play',
                     'death',
                     'doctor',
                     'father-daughter-relationship',
                     'father-son-relationship',
                     'female-nudity',
                     'fight',
                     'gun',
                     'hospital',
                     'husband-wife-relationship',
                     'love',
                     'male-frontal-nudity',
                     'marriage',
                     'mother-daughter-relationship',
                     'nudity',
                     'one-word-title',
                     'sequel',
                     'singer',
                     'song',
                     'violence')) AS mk_filtered ON t_filtered.id = mk_filtered.movie_id;