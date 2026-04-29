WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1950 AND 1990
     AND title IN ('(#1.107)',
                   '(#1.109)',
                   '(#1.233)',
                   '(#1.344)',
                   '(#1.440)',
                   'Airplane II: The Sequel',
                   'Apocalypse Now',
                   'Atlanta Falcons vs. Philadelphia Eagles',
                   'Born in Flames',
                   'Brushfire',
                   'Buffalo Bills vs. New York Jets',
                   'Daddys Little Girl',
                   'Dead Ringers',
                   'Diamonds Are Forever',
                   'Getting Even',
                   'Night Moves',
                   'Skin',
                   'Street Scene',
                   'Stress',
                   'The Ambulance',
                   'The Godfather',
                   'The Midas Touch',
                   'The Story of Will Rogers',
                   'The Suicide Club',
                   'The Talk Show',
                   'The Young and the Restless',
                   'To Tell the Truth',
                   'Triangle',
                   'Wuthering Heights')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv series',
                   'video game',
                   'video movie'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('editor',
                   'miscellaneous crew',
                   'producer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('6')
  AND mi2.info_type_id IN ('5')
  AND mi1.info IN ('70 mm 6-Track',
                    'Dolby Digital',
                    'Dolby SR',
                    'Dolby Stereo',
                    'Dolby',
                    'Ultra Stereo')
  AND mi2.info IN ('Finland:K-16',
                    'Germany:BPjM Restricted',
                    'Netherlands:16',
                    'Norway:18',
                    'Singapore:PG',
                    'Spain:18',
                    'Sweden:15',
                    'UK:12',
                    'UK:18',
                    'USA:Approved',
                    'USA:G',
                    'USA:TV-G');