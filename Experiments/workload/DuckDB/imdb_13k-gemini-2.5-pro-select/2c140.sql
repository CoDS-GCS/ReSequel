
SELECT COUNT(*)
FROM
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1875 AND 1975
     AND title IN ('(#1.101)',
                   '(#1.42)',
                   '(#1.45)',
                   '(#1.76)',
                   '(#1.88)',
                   '(#2.18)',
                   '(#5.9)',
                   'Around the World',
                   'Blue Skies',
                   'Chûkon giretsu - Jitsuroku Chûshingura',
                   'Cleopatra',
                   'Cops and Robbers',
                   'Court Martial',
                   'Dobrý voják Svejk',
                   'Game 7',
                   'Hollywood Hotel',
                   'Just for You',
                   'Kdyby tisíc klarinetu',
                   'Law and Disorder',
                   'Nous sommes tous des assassins',
                   'Oliver Twist',
                   'Second Chance',
                   'The Auction',
                   'The Candidate',
                   'The Canterville Ghost',
                   'The Eurovision Song Contest',
                   'The Experiment',
                   'The Guiding Light',
                   'The Hunter',
                   'The Last Hurrah',
                   'The Letter',
                   'The Painted Stallion',
                   'The Pied Piper',
                   'The Tunnel',
                   'Thérèse Raquin',
                   'Till the Clouds Roll By')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('movie',
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
   WHERE ROLE IN ('actor',
                   'actress',
                   'editor',
                   'guest')) AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('1')
  AND mi1.info IN ('100',
                    '102',
                    '120',
                    '13',
                    '17',
                    '56',
                    '60',
                    '63',
                    '68',
                    '69',
                    'USA:18',
                    'USA:25',
                    'USA:80')
  AND mi2.info_type_id IN ('6')
  AND mi2.info IN ('4-Track Stereo',
                    'Mono',
                    'Silent');