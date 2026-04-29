
SELECT COUNT(*)
FROM
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1875 AND 1975
     AND title IN ('(#1.4)',
                   '(#3.1)',
                   '(#3.8)',
                   '(#5.16)',
                   '(#6.10)',
                   'Above Suspicion',
                   'All That Glitters',
                   'April Fool',
                   'Around the World',
                   'Beauty and the Beast',
                   'Bright Lights',
                   'Claudia',
                   'Dirty Harry',
                   'Gypsy',
                   'Hangmen Also Die!',
                   'Heidi',
                   'Hot Water',
                   'Hunted',
                   'Jam Session',
                   'Johnny Belinda',
                   'Kill or Cure',
                   'Leuchtfeuer',
                   'Los miserables',
                   'Once Upon a Time',
                   'Out of This World',
                   'Rich Man, Poor Man',
                   'Samurai',
                   'Scene of the Crime',
                   'Six Bridges to Cross',
                   'Smoke Screen',
                   'Tartuffe',
                   'The Abominable Snowman',
                   'The Big Parade of Comedy',
                   'The Call of the Wild',
                   'The Fighter',
                   'The Green Pastures',
                   'The Guiding Light',
                   'The Mark of Cain',
                   'The Noose',
                   'The Prize',
                   'The Roaring Twenties',
                   'The Ten Commandments',
                   'Vendetta',
                   'Yellow Jack')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('movie',
                   'tv movie',
                   'tv series',
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
                   'composer',
                   'writer')) AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('4')
  AND mi1.info IN ('Bulgarian',
                    'Czech',
                    'Hungarian',
                    'Japanese',
                    'Korean',
                    'Romanian')
  AND mi2.info_type_id IN ('3')
  AND mi2.info IN ('Action',
                    'Animation',
                    'Crime',
                    'Fantasy',
                    'Horror',
                    'Sport');