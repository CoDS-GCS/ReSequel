
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1925 + 1 AND 1975
  AND kt.kind IN ('tv series',
                  'video game')
  AND mi1.info_type_id = '3'
  AND mi1.info IN ('Adult',
                   'Animation',
                   'Crime',
                   'Drama')
  AND mi2.info_type_id = '5'
  AND mi2.info IN ('Argentina:Atp',
                   'Norway:16',
                   'USA:X',
                   'West Germany:16')
  AND rt.role IN ('director',
                  'writer')
  AND n.gender IN ('f');