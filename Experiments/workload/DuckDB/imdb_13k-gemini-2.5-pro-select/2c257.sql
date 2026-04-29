
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
  AND mi2.info IN ('Afrikaans',
                    'Czech',
                    'German',
                    'Japanese',
                    'Serbian',
                    'Swiss German',
                    'Thai')
  AND it2.id IN ('4')
  AND t.production_year BETWEEN 1925 AND 2015
  AND t.title IN ('(#16.59)',
                   '(1995-11-18)',
                   '(2006-04-08)',
                   '(2007-12-24)',
                   '(2009-11-10)',
                   'Bakit di totohanin',
                   'Bee Movie',
                   'Death Goes On',
                   'Final Episode',
                   'Gordy',
                   'Kiss and Tell',
                   'Kitumba',
                   'La reine et le cardinal',
                   'My Son, My Son, What Have Ye Done',
                   'Original Sin',
                   'Skin and Bone',
                   'The Perfect Family')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND n.gender IN ('f',
                    'm')
  AND rt.role IN ('costume designer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer');