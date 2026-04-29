
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('movie',
                   'tv movie')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id IN ('6')
AND mi1.info IN ('4-Track Stereo',
                    'Dolby',
                    'Mono',
                    'Stereo',
                    'Ultra Stereo')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info_type_id IN ('5')
AND mi2.info IN ('Canada:13+',
                    'Finland:(Banned)',
                    'Italy:VM14',
                    'Norway:18',
                    'Portugal:M/18',
                    'USA:PG',
                    'USA:PG-13',
                    'West Germany:18')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('cinematographer',
                   'editor',
                   'writer')
JOIN name AS n ON ci.person_id = n.id
AND (n.gender IN ('f')
     OR n.gender IS NULL)
WHERE t.production_year BETWEEN 1950 AND 1990
  AND t.title IN ('(#1.499)',
                   '(#1.613)',
                   '(#1.756)',
                   '(#3.35)',
                   '(#3.6)',
                   '(#4.18)',
                   '2001: A Space Odyssey',
                   'A Slice of Life',
                   'American Flyers',
                   'Full House',
                   'If Tomorrow Comes',
                   'Its All Happening',
                   'Love Letters',
                   'More American Graffiti',
                   'No Way Out',
                   'Providence',
                   'Rituals',
                   'Sid and Nancy',
                   'The 61st Annual Academy Awards');