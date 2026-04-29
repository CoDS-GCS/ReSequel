WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 1975
     AND t.title IN ('(#1.47)',
                   '(#1.48)',
                   '(#2.35)',
                   '(#3.29)',
                   '(#5.21)',
                   'A Night at the Opera',
                   'Barbary Coast',
                   'Border Incident',
                   'Chucho el Roto',
                   'Crack-Up',
                   'David Copperfield',
                   'Escapade',
                   'Flight',
                   'Geronimo',
                   'Gunfight at the O.K. Corral',
                   'Harlow',
                   'Hello, Dolly!',
                   'Hunt the Man Down',
                   'It Started with Eve',
                   'Jailhouse Rock',
                   'Jam Session',
                   'Life with Father',
                   'Raffles',
                   'Saboteur',
                   'Springtime in the Rockies',
                   'The Awful Truth',
                   'The Cardinal',
                   'The Condemned',
                   'The Elopement',
                   'The Facts of Life',
                   'The Guest',
                   'The Guiding Light',
                   'The Hard Way',
                   'The Imposter',
                   'The Raiders',
                   'The Scavengers',
                   'They Died with Their Boots On',
                   'They Were Expendable',
                   'Thomas Müntzer',
                   'Windfall')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv series'))
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
  AND rt.role IN ('director',
                   'miscellaneous crew',
                   'production designer',
                   'writer')
  AND it1.id IN ('4')
  AND mi1.info IN ('Bengali',
                    'Bulgarian',
                    'Cantonese',
                    'Czech',
                    'Dutch',
                    'English',
                    'French',
                    'German',
                    'Greek',
                    'Hindi',
                    'Mandarin',
                    'Portuguese',
                    'Swedish',
                    'Tagalog')
  AND it2.id IN ('6')
  AND mi2.info IN ('4-Track Stereo',
                    'Mono',
                    'Silent',
                    'Stereo');