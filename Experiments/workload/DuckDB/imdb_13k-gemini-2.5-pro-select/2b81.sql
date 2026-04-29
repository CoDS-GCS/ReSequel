
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year >= 1875
     AND t.production_year <= 1975
     AND kt.kind IN ('episode',
                   'movie')) AS t_filtered
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('6')
     AND info IN ('Mono')) AS mi1_filtered ON t_filtered.id = mi1_filtered.movie_id
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('5')
     AND info IN ('Argentina:13',
                    'Canada:G',
                    'Germany:12',
                    'Iceland:L',
                    'Portugal:M/12',
                    'Sweden:11',
                    'UK:18',
                    'USA:X')) AS mi2_filtered ON t_filtered.id = mi2_filtered.movie_id
JOIN
  (SELECT mk.movie_id
   FROM movie_keyword AS mk
   JOIN keyword AS k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('based-on-novel',
                     'family-relationships',
                     'father-son-relationship',
                     'fight',
                     'gun',
                     'homosexual',
                     'independent-film',
                     'interview',
                     'jealousy',
                     'male-frontal-nudity',
                     'marriage',
                     'murder',
                     'new-york-city',
                     'sex',
                     'singing')) AS mk_filtered ON t_filtered.id = mk_filtered.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IS NULL
     AND rt.role IN ('production designer')) AS ci_filtered ON t_filtered.id = ci_filtered.movie_id;