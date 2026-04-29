
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
  AND mi2.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'DTS',
                    'Dolby',
                    'Mono',
                    'Stereo')
  AND it2.id IN ('6')
  AND t.production_year BETWEEN 1925 AND 2015
  AND t.title IN ('(#1.1494)',
                   '(#1.3459)',
                   '(#17.58)',
                   '(1997-10-02)',
                   '(2002-12-14)',
                   '47th Annual Academy of Country Music Awards',
                   'A Capitol Fourth',
                   'Bloody Mary',
                   'Dead and Alive',
                   'Dont Be Blinded by the Headlights',
                   'Fur: An Imaginary Portrait of Diane Arbus',
                   'Home Alone da Riber',
                   'Mommy and Me',
                   'On Your Way Down',
                   'Refugees',
                   'Secrets of the Heart',
                   'The 31st Annual Peoples Choice Awards',
                   'Theres a Pattern Here',
                   'U2: Rattle and Hum')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game')
  AND n.gender IN ('f',
                    'm')
  AND rt.role IN ('director',
                   'miscellaneous crew');