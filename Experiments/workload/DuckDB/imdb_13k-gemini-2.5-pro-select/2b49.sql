WITH mi1_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('16')
     AND info IN ('USA:2003',
                    'USA:2004',
                    'USA:2005',
                    'USA:2006')),
     mi2_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('3')
     AND info IN ('Adult')),
     ci_filtered AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IS NULL
     AND rt.role IN ('editor'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN mi1_filtered mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered mi2 ON t.id = mi2.movie_id
JOIN ci_filtered ci ON t.id = ci.movie_id
WHERE t.production_year >= 1950
  AND t.production_year <= 2010
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND k.keyword IN ('anal-sex',
                     'bare-chested-male',
                     'cigarette-smoking',
                     'dancing',
                     'dog',
                     'flashback',
                     'kidnapping',
                     'lesbian',
                     'mother-son-relationship',
                     'non-fiction',
                     'nudity',
                     'oral-sex',
                     'police',
                     'revenge',
                     'sequel',
                     'song');