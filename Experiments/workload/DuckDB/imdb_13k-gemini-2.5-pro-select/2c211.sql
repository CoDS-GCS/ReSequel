
SELECT COUNT(*)
FROM
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1875 AND 1975
     AND title IN ('(#1.15)',
                   '(#2.2)',
                   '(#5.17)',
                   'April Fool',
                   'Der Bettelstudent',
                   'Die Falle',
                   'Die Unbesiegbaren',
                   'Ein idealer Gatte',
                   'Escapade',
                   'Full Circle',
                   'Game 7',
                   'Hamlet',
                   'Here Come the Girls',
                   'Inferno',
                   'Its in the Air',
                   'Julius Caesar',
                   'Lenny',
                   'Marie Antoinette',
                   'Night Club',
                   'Nous sommes tous des assassins',
                   'Otello',
                   'Quarta puntata',
                   'Ruggles of Red Gap',
                   'Solange Leben in mir ist',
                   'The Best Man Wins',
                   'The Great Impersonation',
                   'The Greatest Story Ever Told',
                   'The Male Animal',
                   'The Matchmaker',
                   'The Outcasts of Poker Flat',
                   'The Search',
                   'The Tunnel',
                   'Treasure Island',
                   'Two for the Money',
                   'Volpone',
                   'Wilson')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('movie',
                   'tv movie',
                   'video game'))) AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN
  (SELECT id
   FROM name
   WHERE gender IS NULL) AS n ON ci.person_id = n.id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('costume designer')) AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('18')
  AND mi1.info IN ('Alabama Hills, Lone Pine, California, USA',
                    'General Service Studios - 1040 N. Las Palmas, Hollywood, Los Angeles, California, USA',
                    'Hollywood, Los Angeles, California, USA',
                    'Iverson Ranch - 1 Iverson Lane, Chatsworth, Los Angeles, California, USA',
                    'Mexico City, Distrito Federal, Mexico',
                    'Republic Studios, Hollywood, Los Angeles, California, USA',
                    'Samuel Goldwyn Studios - 7200 Santa Monica Boulevard, West Hollywood, California, USA',
                    'Shepperton Studios, Shepperton, Surrey, England, UK',
                    'Stage 14, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 17, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 22, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 3, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA')
  AND mi2.info_type_id IN ('6')
  AND mi2.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'Mono',
                    'Stereo');