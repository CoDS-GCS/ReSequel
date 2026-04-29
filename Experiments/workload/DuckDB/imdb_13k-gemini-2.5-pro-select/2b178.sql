
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('tv series',
                   'video game',
                   'video movie')
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
AND k.keyword IN ('bare-breasts',
                     'based-on-play',
                     'dog',
                     'gay',
                     'homosexual',
                     'hospital',
                     'husband-wife-relationship',
                     'independent-film',
                     'kidnapping',
                     'lesbian-sex',
                     'marriage',
                     'number-in-title',
                     'police',
                     'song')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
AND it1.id IN ('5')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
AND it2.id IN ('2')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actress',
                   'composer')
JOIN name AS n ON ci.person_id = n.id
AND (n.gender IN ('f')
     OR n.gender IS NULL)
WHERE t.production_year BETWEEN 1875 AND 1975
  AND mi1.info IN ('Australia:M',
                    'Finland:(Banned)',
                    'Finland:K-12',
                    'Iceland:L',
                    'India:U',
                    'UK:18',
                    'UK:A',
                    'UK:PG',
                    'UK:X',
                    'USA:Not Rated',
                    'USA:PG',
                    'USA:Passed',
                    'USA:Unrated',
                    'West Germany:18',
                    'West Germany:6')
  AND mi2.info IN ('Black and White',
                    'Color');