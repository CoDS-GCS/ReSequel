
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN title AS t ON ci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE n.gender IS NULL
  AND rt.role IN ('miscellaneous crew')
  AND t.production_year BETWEEN 1875 AND 1975
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
  AND it1.id IN ('5')
  AND mi1.info IN ('Norway:16',
                    'Sweden:Btl',
                    'UK:A',
                    'USA:Not Rated',
                    'USA:PG')
  AND it2.id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color')
  AND k.keyword IN ('cigarette-smoking',
                     'doctor',
                     'father-son-relationship',
                     'gun',
                     'hardcore',
                     'kidnapping',
                     'party',
                     'sequel',
                     'sex',
                     'singing',
                     'suicide');