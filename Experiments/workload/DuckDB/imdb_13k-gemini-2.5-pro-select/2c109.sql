WITH filtered_mi1 AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   WHERE mi1.info_type_id IN ('2')
     AND mi1.info IN ('Black and White',
                    'Color')),
     filtered_mi2 AS
  (SELECT mi2.movie_id
   FROM movie_info AS mi2
   WHERE mi2.info_type_id IN ('8')
     AND mi2.info IN ('Cuba',
                    'East Germany',
                    'Greece',
                    'Hungary',
                    'Iran',
                    'Italy',
                    'Nigeria',
                    'Peru',
                    'South Africa'))
SELECT COUNT(*)
FROM title AS t
JOIN filtered_mi1 ON t.id = filtered_mi1.movie_id
JOIN filtered_mi2 ON t.id = filtered_mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN kind_type AS kt ON t.kind_id = kt.id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND t.title IN ('(#1.269)',
                   '(#1.5491)',
                   '(#27.4)',
                   '(#3.16)',
                   '(#8.86)',
                   '(1999-08-04)',
                   '(2002-02-21)',
                   '(2006-08-22)',
                   '(2009-06-19)',
                   '(2011-02-09)',
                   'Acid Rain',
                   'Ah, Wilderness!',
                   'Anger Management',
                   'Cinema Suites: Long Beach, CA',
                   'Deus Ex',
                   'Different',
                   'Divination',
                   'Fuenteovejuna',
                   'Hudson Hawk',
                   'Larry the Cable Guys Hula-Palooza Christmas Luau',
                   'Les deux orphelines',
                   'Little Black Dress',
                   'Live Show',
                   'Love Is Not Enough',
                   'Near Death Experience',
                   'One Last Shot',
                   'Retaliation',
                   'The 56th Annual Primetime Emmy Awards',
                   'The Jigsaw Man',
                   'The Ladder',
                   'The Lighthorsemen',
                   'The Outlaw')
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND rt.role IN ('cinematographer',
                   'writer')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video movie');