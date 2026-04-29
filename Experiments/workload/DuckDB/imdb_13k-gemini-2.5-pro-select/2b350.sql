
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1990 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'video movie')) AS t_filtered
JOIN
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('8')
     AND mi.info IN ('Argentina',
                    'USA')) AS mi1_filtered ON t_filtered.id = mi1_filtered.movie_id
JOIN
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('5')
     AND mi.info IN ('Argentina:13',
                    'Argentina:Atp',
                    'Australia:M',
                    'Philippines:PG-13')) AS mi2_filtered ON t_filtered.id = mi2_filtered.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info ci
   JOIN role_type rt ON ci.role_id = rt.id
   JOIN name n ON ci.person_id = n.id
   WHERE rt.role IN ('miscellaneous crew')
     AND n.gender IN ('f')) AS ci_filtered ON t_filtered.id = ci_filtered.movie_id
JOIN
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('bare-chested-male',
                     'blood',
                     'doctor',
                     'family-relationships',
                     'father-son-relationship',
                     'friendship',
                     'hardcore',
                     'homosexual',
                     'husband-wife-relationship',
                     'kidnapping',
                     'lesbian',
                     'love',
                     'male-frontal-nudity',
                     'murder',
                     'non-fiction',
                     'one-word-title',
                     'oral-sex',
                     'police',
                     'singing',
                     'surrealism')) AS mk_filtered ON t_filtered.id = mk_filtered.movie_id;