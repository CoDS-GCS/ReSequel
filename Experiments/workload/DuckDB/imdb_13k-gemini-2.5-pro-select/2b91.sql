WITH t_filtered AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 2015
     AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game'))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE mi1.info_type_id IN ('16')
  AND mi1.info IN ('USA:1995',
                    'USA:1997',
                    'USA:1998',
                    'USA:2000',
                    'USA:2001')
  AND mi2.info_type_id IN ('2')
  AND mi2.info IN ('Color')
  AND n.gender IN ('m')
  AND rt.role IN ('costume designer')
  AND k.keyword IN ('bare-breasts',
                     'bare-chested-male',
                     'cigarette-smoking',
                     'dancing',
                     'death',
                     'female-nudity',
                     'flashback',
                     'gay',
                     'homosexual',
                     'independent-film',
                     'love',
                     'male-frontal-nudity',
                     'marriage',
                     'mother-son-relationship',
                     'murder',
                     'nudity',
                     'police',
                     'revenge',
                     'suicide');