
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND it1.id IN ('18')
  AND mi1.info IN ('Amsterdam, Noord-Holland, Netherlands',
                    'Burbank, California, USA',
                    'Dallas, Texas, USA',
                    'France',
                    'Helsinki, Finland',
                    'Hong Kong, China',
                    'Lisbon, Portugal',
                    'Nashville, Tennessee, USA',
                    'New Orleans, Louisiana, USA',
                    'Orlando, Florida, USA',
                    'Pasadena, California, USA',
                    'Phoenix, Arizona, USA',
                    'Santa Clarita, California, USA',
                    'Tokyo, Japan',
                    'Vienna, Austria')
  AND it2.id IN ('8')
  AND mi2.info IN ('Austria',
                    'Finland',
                    'France',
                    'Hong Kong',
                    'Japan',
                    'Netherlands',
                    'Portugal',
                    'USA')
  AND rt.role IN ('editor')
  AND n.gender IN ('m');