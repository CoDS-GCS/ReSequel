
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
  AND mi2.info IN ('Finland',
                    'France',
                    'Ireland',
                    'Peru',
                    'Philippines',
                    'Romania',
                    'Soviet Union',
                    'Thailand')
  AND it2.id IN ('8')
  AND t.production_year BETWEEN 1925 AND 2015
  AND t.title IN ('(#1.10082)',
                   '(#1.1110)',
                   '(#13.7)',
                   '(#5.134)',
                   '(#7.82)',
                   '(2000-03-30)',
                   '(2003-10-18)',
                   '(2010-02-05)',
                   '(2012-03-05)',
                   'Betrayal of Trust',
                   'Code Name: The Cleaner',
                   'Dead Again',
                   'Faraar',
                   'How William Shatner Changed the World',
                   'I epithesi tou gigantiaiou mousaka',
                   'Intermezzo',
                   'Jackie Bouvier Kennedy Onassis',
                   'Rogues Gallery',
                   'The Last Run',
                   'The Lost Prince',
                   'The Offspring')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND n.gender IN ('f',
                    'm')
  AND rt.role IN ('cinematographer',
                   'editor',
                   'miscellaneous crew',
                   'writer');