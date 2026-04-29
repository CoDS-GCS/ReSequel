WITH ci_filtered AS
  (SELECT ci.movie_id
   FROM cast_info ci
   JOIN role_type rt ON ci.role_id = rt.id
   JOIN name n ON ci.person_id = n.id
   WHERE rt.role IN ('costume designer')
     AND n.gender IN ('f'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN ci_filtered AS ci ON t.id = ci.movie_id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
  AND it1.id IN ('3')
  AND mi1.info IN ('Adventure',
                    'Documentary',
                    'Drama',
                    'Music',
                    'Romance')
  AND it2.id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color')
  AND k.keyword IN ('bare-chested-male',
                     'based-on-play',
                     'dog',
                     'father-daughter-relationship',
                     'father-son-relationship',
                     'female-nudity',
                     'fight',
                     'hospital',
                     'lesbian',
                     'lesbian-sex',
                     'mother-son-relationship',
                     'murder',
                     'nudity',
                     'one-word-title',
                     'party',
                     'police',
                     'sequel',
                     'sex',
                     'surrealism');