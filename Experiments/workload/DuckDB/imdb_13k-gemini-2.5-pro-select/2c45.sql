
SELECT COUNT(*)
FROM
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 1975
     AND title IN ('(#1.56)',
                   'A Guy Named Joe',
                   'A Star Is Born',
                   'Country Boy',
                   'Do Not Disturb',
                   'Folies Bergère de Paris',
                   'Foreign Correspondent',
                   'Golden Girl',
                   'Kim',
                   'Lifeline',
                   'Money to Burn',
                   'Pack Up Your Troubles',
                   'Shadow of a Man',
                   'The Dinner Party',
                   'The Man Who Broke the Bank at Monte Carlo',
                   'The Other Woman',
                   'The Texas Rangers')
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
   WHERE ROLE IN ('editor')) AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('3')
  AND mi1.info IN ('Action',
                    'Adult',
                    'Crime',
                    'Documentary',
                    'Drama',
                    'Music',
                    'Romance',
                    'Sport',
                    'War',
                    'Western')
  AND mi2.info_type_id IN ('6')
  AND mi2.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'Stereo');