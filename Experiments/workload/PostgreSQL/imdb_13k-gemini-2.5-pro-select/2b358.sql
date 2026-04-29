WITH mi1_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('2')
     AND mi.info IN ('Black and White',
                    'Color')),
     mi2_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('8')
     AND mi.info IN ('Austria',
                    'Brazil',
                    'East Germany',
                    'Federal Republic of Yugoslavia',
                    'Romania',
                    'Singapore'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN mi1_filtered mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1950 AND 2010
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND rt.role IN ('composer',
                   'editor')
  AND n.gender IN ('f',
                    'm')
  AND k.keyword IN ('21-gun-salute',
                     'art-catalogue',
                     'atomic-weapons',
                     'bulgarian-woman',
                     'caterer',
                     'david-cleveland',
                     'dichotomy',
                     'epperly',
                     'football-movie',
                     'holding-someones-breasts',
                     'king-of-the-hill',
                     'knocking-on-a-wall',
                     'learning-to-walk',
                     'lost-belonging',
                     'monarch-butterfly',
                     'novel-writer',
                     'primogeniture',
                     'rabat-morocco',
                     'reference-to-dante-alighieri',
                     'reservation-jumper',
                     'sassi-di-matera',
                     'strip-fooseball',
                     'tax-official',
                     'using-a-microphone-stand-as-an-air-guitar');