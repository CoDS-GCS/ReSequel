WITH mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('anal-sex',
                     'based-on-novel',
                     'female-frontal-nudity',
                     'fight',
                     'friendship',
                     'gay',
                     'independent-film',
                     'love',
                     'male-nudity',
                     'mother-daughter-relationship',
                     'new-york-city',
                     'one-word-title',
                     'sequel',
                     'song'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN mk_filtered AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND it1.id IN ('6')
  AND mi1.info IN ('Dolby Digital',
                    'Dolby SR',
                    'Stereo')
  AND it2.id IN ('7')
  AND mi2.info IN ('PCS:Spherical',
                    'PFM:Video',
                    'RAT:1.33 : 1',
                    'RAT:1.85 : 1')
  AND rt.role IN ('director',
                   'writer')
  AND n.gender IN ('m');