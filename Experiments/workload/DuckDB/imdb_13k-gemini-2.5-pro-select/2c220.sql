
SELECT COUNT(*)
FROM title AS t,
     cast_info AS ci,
     movie_info AS mi1,
     movie_info AS mi2
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.production_year <= 1975
  AND t.production_year >= 1875
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
  AND mi1.info_type_id IN ('2')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info_type_id IN ('17')
  AND mi2.info IN ('Last show of the series.',
                    'One of over 700 Paramount Productions, filmed between 1929 and 1949, which were sold to MCA/Universal in 1958 for television distribution, and have been owned and controlled by Universal ever since.',
                    'Original French title is undetermined.')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'video game',
                   'video movie'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f',
                    'm'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('composer',
                   'costume designer',
                   'miscellaneous crew',
                   'producer',
                   'production designer'));