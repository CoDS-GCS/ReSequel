
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1950 + 1 AND 1990
  AND kt.kind IN ('tv series',
                  'video game',
                  'video movie')
  AND mi1.info_type_id = '3'
  AND mi1.info IN ('Comedy',
                   'Drama',
                   'Thriller')
  AND mi2.info_type_id = '5'
  AND mi2.info IN ('Argentina:Atp',
                   'Australia:M',
                   'Finland:K-16',
                   'Finland:S',
                   'Iceland:16',
                   'Iceland:L',
                   'Sweden:15',
                   'Sweden:Btl',
                   'West Germany:12')
  AND rt.role IN ('editor')
  AND n.gender IN ('m');