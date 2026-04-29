
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1950 AND 1990
  AND t.title IN ('(#1.235)',
                   '(#1.306)',
                   '(#1.373)',
                   '(#1.456)',
                   '(#1.469)',
                   '(#1.493)',
                   '(#1.876)',
                   '(#1.924)',
                   '(#1.928)',
                   '(#3.29)',
                   '(#3.31)',
                   '(#4.29)',
                   'Dr. Jekyll and Mr. Hyde',
                   'Hansel and Gretel',
                   'Hardcore',
                   'Hostages',
                   'Sabotage',
                   'Sink or Swim',
                   'Teachers Pest',
                   'The Compleat Al',
                   'The Coward',
                   'The Critic',
                   'The House on Carroll Street',
                   'The Road',
                   'The Winner',
                   'Trio')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND rt.role IN ('actress',
                   'editor',
                   'guest',
                   'producer',
                   'writer')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND it1.id IN ('6')
  AND it2.id IN ('2')
  AND mi1.info IN ('4-Track Stereo',
                    'Dolby',
                    'Mono',
                    'Silent',
                    'Stereo')
  AND mi2.info IN ('Black and White',
                    'Color');