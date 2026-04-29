
SELECT COUNT(*)
FROM movie_info AS mi1
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON mi1.movie_id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN title AS t ON mi1.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE mi1.info IN ('Black and White',
                    'Color')
  AND it1.id IN ('2')
  AND mi2.info IN ('Last show of the series.',
                    'One of over 700 Paramount Productions, filmed between 1929 and 1949, which were sold to MCA/Universal in 1958 for television distribution, and have been owned and controlled by Universal ever since.',
                    'Original French title is undetermined.')
  AND it2.id IN ('17')
  AND t.production_year BETWEEN 1875 AND 1975
  AND t.title IN ('(#1.19)',
                   '(#1.87)',
                   'Crime et châtiment',
                   'Ghost Town',
                   'Its a Small World',
                   'Little Egypt',
                   'My Brothers Keeper',
                   'Out of the Night',
                   'Playgirl',
                   'Smile',
                   'Street Scene',
                   'The Devil Is Driving',
                   'The Fighting Devil Dogs',
                   'The Gangs All Here',
                   'The Importance of Being Earnest',
                   'The Inheritance',
                   'The Longest Day',
                   'The Lottery Lover',
                   'The Predators',
                   'Welcome Stranger')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'video game',
                   'video movie')
  AND n.gender IN ('f',
                    'm')
  AND rt.role IN ('composer',
                   'costume designer',
                   'miscellaneous crew',
                   'producer',
                   'production designer');