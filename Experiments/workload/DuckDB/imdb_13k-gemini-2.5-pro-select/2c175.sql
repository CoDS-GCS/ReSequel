WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 1975
     AND t.title IN ('(#1.15)',
                   '(#1.80)',
                   '(#2.21)',
                   '(#4.1)',
                   'Anna Christie',
                   'Cimarron',
                   'Fair Exchange',
                   'Father of the Bride',
                   'Holnap lesz fácán',
                   'Its a Pleasure',
                   'Let em Have It',
                   'Navy Wife',
                   'Ordeal',
                   'Quo Vadis',
                   'Roughly Speaking',
                   'The Other Woman',
                   'The Picnic',
                   'The Sea of Grass',
                   'The Test')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'video movie'))
SELECT COUNT(*)
FROM filtered_movies AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE n.gender IN ('m')
  AND rt.role IN ('producer',
                   'production designer')
  AND it1.id IN ('8')
  AND mi1.info IN ('Belgium',
                    'Hungary',
                    'Poland',
                    'South Korea',
                    'Turkey',
                    'UK')
  AND it2.id IN ('4')
  AND mi2.info IN ('Bengali',
                    'English',
                    'Filipino',
                    'Finnish',
                    'French',
                    'Georgian',
                    'German',
                    'Italian',
                    'Norwegian',
                    'Russian',
                    'Spanish',
                    'Tamil',
                    'Turkish');