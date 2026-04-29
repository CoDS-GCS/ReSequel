
SELECT COUNT(*)
FROM
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1950 AND 1990
     AND title IN ('(#1.261)',
                   '(#1.269)',
                   '(#1.316)',
                   '(#1.541)',
                   '(#1.665)',
                   '(#10.13)',
                   '(#11.11)',
                   'A Hard Days Night',
                   'Assault',
                   'Asylum',
                   'Bedtime Story',
                   'Claws',
                   'Coriolanus',
                   'Deadlock',
                   'Epidemic',
                   'Higher Education',
                   'Insaaf',
                   'Journeys End',
                   'Marusa no onna 2',
                   'My Left Foot: The Story of Christy Brown',
                   'Old Acquaintance',
                   'One of a Kind',
                   'Pandoras Box',
                   'Poker',
                   'Thank God Its Friday',
                   'The Big Easy',
                   'The Kiss',
                   'The Rival',
                   'The Sunshine Boys',
                   'Troop Beverly Hills',
                   'Young Love')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game'))) AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN
  (SELECT id
   FROM name
   WHERE gender IS NULL) AS n ON ci.person_id = n.id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('cinematographer',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')) AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('3')
  AND mi1.info IN ('Adult',
                    'Animation',
                    'Documentary',
                    'Family',
                    'History',
                    'Horror',
                    'Romance',
                    'War',
                    'Western')
  AND mi2.info_type_id IN ('7')
  AND mi2.info IN ('LAB:Movielab, USA',
                    'LAB:Rank Film Laboratories, Denham, UK',
                    'PCS:Panavision',
                    'PCS:Spherical',
                    'PCS:Tohoscope',
                    'PFM:16 mm',
                    'PFM:35 mm');