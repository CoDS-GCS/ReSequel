
SELECT COUNT(*)
FROM
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 1975
     AND title IN ('(#1.47)',
                   '(#4.26)',
                   'Cinderella',
                   'Fools Gold',
                   'Going Home',
                   'Ill Fix It',
                   'Law and Disorder',
                   'Shakedown',
                   'The Box',
                   'The Gangs All Here',
                   'The Scarlet Pimpernel',
                   'The Shepherd of the Hills',
                   'You and Me')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('movie',
                   'tv series',
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
   WHERE ROLE IN ('actress',
                   'composer',
                   'costume designer',
                   'production designer')) AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('4')
  AND mi1.info IN ('English',
                    'German',
                    'Hindi',
                    'Italian',
                    'Japanese',
                    'Latin',
                    'Polish',
                    'Portuguese',
                    'Spanish')
  AND mi2.info_type_id IN ('17')
  AND mi2.info IN ('Last show of the series.',
                    'One of over 700 Paramount Productions, filmed between 1929 and 1949, which were sold to MCA/Universal in 1958 for television distribution, and have been owned and controlled by Universal ever since.');