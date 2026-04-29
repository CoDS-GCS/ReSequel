WITH mi1_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('2')
     AND info IN ('Color')),
     mi2_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('18')
     AND info IN ('Minneapolis, Minnesota, USA',
                    'Stage 17, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA')),
     ci_filtered AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IS NULL
     AND rt.role IN ('composer'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN mi1_filtered mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered mi2 ON t.id = mi2.movie_id
JOIN ci_filtered ci ON t.id = ci.movie_id
WHERE t.production_year >= 1975
  AND t.production_year <= 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND k.keyword IN ('anal-sex',
                     'bare-breasts',
                     'based-on-play',
                     'dog',
                     'family-relationships',
                     'female-frontal-nudity',
                     'fight',
                     'flashback',
                     'homosexual',
                     'interview',
                     'jealousy',
                     'lesbian-sex',
                     'male-frontal-nudity',
                     'mother-daughter-relationship',
                     'murder',
                     'police');