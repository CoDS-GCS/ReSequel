WITH t_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 1975
     AND t.title IN ('(#1.22)',
                   '(#1.39)',
                   '(#1.66)',
                   '(#2.12)',
                   'Aoi sanmyaku',
                   'Dobrý voják Svejk',
                   'Forever and a Day',
                   'King Kong',
                   'Marina',
                   'North to Alaska',
                   'Si Paris nous était conté',
                   'Teachers Pet',
                   'The Artist',
                   'The Assassins',
                   'The Birthday Party')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv series',
                   'video game',
                   'video movie'))
SELECT COUNT(*)
FROM t_filtered
JOIN cast_info AS ci ON t_filtered.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t_filtered.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t_filtered.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE n.gender IS NULL
  AND rt.role IN ('composer',
                   'director',
                   'editor')
  AND it1.id IN ('4')
  AND mi1.info IN ('Bengali',
                    'Finnish',
                    'Greek',
                    'Japanese',
                    'Serbo-Croatian',
                    'Urdu')
  AND it2.id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color');