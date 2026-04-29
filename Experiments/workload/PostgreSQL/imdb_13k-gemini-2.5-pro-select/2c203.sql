
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year <= 2015
  AND t.production_year >= 1925
  AND t.title IN ('(#1.1996)',
                   '(#10.7)',
                   '(#3.231)',
                   '(2004-01-27)',
                   '(2004-03-10)',
                   '(2012-05-28)',
                   'Aulad',
                   'City of Cincinnati',
                   'Foreign Exchange Student',
                   'Frame Up',
                   'Friends Like These',
                   'From the Earth to the Moon',
                   'Lo kong ching chuen',
                   'Made Men',
                   'Noi credevamo',
                   'Notes',
                   'Philippi',
                   'Some Enchanted Evening',
                   'Sweet Nothing',
                   'The Cleaner',
                   'The Crucible',
                   'To Bee or Not to Bee',
                   'Unthinkable',
                   'Walking with the Enemy')
  AND kt.kind IN ('movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND n.gender IN ('f',
                    'm')
  AND rt.role IN ('actor',
                   'costume designer',
                   'editor',
                   'guest',
                   'producer')
  AND mi1.info_type_id IN ('3')
  AND mi1.info IN ('Action',
                    'Adventure',
                    'Family',
                    'Film-Noir',
                    'Music',
                    'Mystery',
                    'Talk-Show')
  AND mi2.info_type_id IN ('8')
  AND mi2.info IN ('Argentina',
                    'Czechoslovakia',
                    'Georgia',
                    'Indonesia',
                    'Morocco',
                    'Nigeria',
                    'Poland',
                    'Singapore',
                    'Slovenia',
                    'South Korea',
                    'United Arab Emirates',
                    'Venezuela');