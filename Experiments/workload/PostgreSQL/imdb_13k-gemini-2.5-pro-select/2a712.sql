WITH filtered_mi1 AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('5')
     AND info IN ('Argentina:Atp',
                    'Australia:G',
                    'Finland:K-16',
                    'Iceland:16',
                    'UK:15',
                    'USA:X',
                    'West Germany:16')),
     filtered_mi2 AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('8')
     AND info IN ('Argentina',
                    'France',
                    'USA'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON k.id = mk.keyword_id
JOIN filtered_mi1 AS mi1 ON t.id = mi1.movie_id
JOIN filtered_mi2 AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1950 AND 1990
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
  AND rt.role IN ('writer')
  AND n.gender IS NULL;