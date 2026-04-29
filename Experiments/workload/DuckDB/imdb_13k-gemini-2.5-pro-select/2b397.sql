
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year >= 1990
     AND t.production_year <= 2015
     AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')) AS t_filtered
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('6')
     AND info IN ('Stereo')) AS mi1_filtered ON t_filtered.id = mi1_filtered.movie_id
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('3')
     AND info IN ('Crime',
                    'Documentary')) AS mi2_filtered ON t_filtered.id = mi2_filtered.movie_id
JOIN
  (SELECT mk.movie_id
   FROM movie_keyword AS mk
   JOIN keyword AS k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('based-on-play',
                     'doctor',
                     'female-nudity',
                     'flashback',
                     'hardcore',
                     'interview',
                     'kidnapping',
                     'lesbian',
                     'love',
                     'male-frontal-nudity',
                     'male-nudity',
                     'marriage',
                     'new-york-city',
                     'number-in-title')) AS mk_filtered ON t_filtered.id = mk_filtered.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IS NULL
     AND rt.role IN ('editor')) AS ci_filtered ON t_filtered.id = ci_filtered.movie_id;