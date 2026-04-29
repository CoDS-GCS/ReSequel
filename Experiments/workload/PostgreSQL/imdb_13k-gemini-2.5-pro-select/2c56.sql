
SELECT COUNT(*)
FROM
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1875 AND 1975
     AND title IN ('(#1.114)',
                   '(#1.83)',
                   '(#1.87)',
                   '(#2.41)',
                   'Around the World in Eighty Days',
                   'Bells Are Ringing',
                   'Day of Reckoning',
                   'Der Bettelstudent',
                   'Destiny',
                   'Dirty Harry',
                   'East Side, West Side',
                   'Giuseppe Verdi',
                   'Haunted House',
                   'Holnap lesz fácán',
                   'Island in the Sky',
                   'Its a Great Life',
                   'Jesse James',
                   'Lenny',
                   'Meet Me in Las Vegas',
                   'Pat and Mike',
                   'Sea Devils',
                   'Star Spangled Rhythm',
                   'Teresa',
                   'The Crowd Roars',
                   'The Engagement Ring',
                   'The Judge',
                   'The Kid from Texas',
                   'The Losers',
                   'The Morning After',
                   'The Oath',
                   'The Party',
                   'The Professionals',
                   'The Star',
                   'The Westerner',
                   'The Women',
                   'Time Out of Mind',
                   'Titanic',
                   'Too Hot to Handle',
                   'Whistling in the Dark')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('movie',
                   'tv movie',
                   'video game',
                   'video movie'))) AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN
  (SELECT id
   FROM name
   WHERE gender IS NULL) AS n ON ci.person_id = n.id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'cinematographer',
                   'composer',
                   'director')) AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('4')
  AND mi1.info IN ('Cantonese',
                    'Dutch',
                    'Filipino',
                    'French',
                    'Greek',
                    'Hindi',
                    'Japanese',
                    'None',
                    'Polish')
  AND mi2.info_type_id IN ('6')
  AND mi2.info IN ('4-Track Stereo',
                    'Mono',
                    'Silent',
                    'Stereo');