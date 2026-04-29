
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 1975
     AND t.title IN ('(#3.21)',
                   '(#4.15)',
                   'A Family Affair',
                   'A Guy Named Joe',
                   'Act of Violence',
                   'Dick Tracy Returns',
                   'Die Falle',
                   'Easy Money',
                   'Fury',
                   'Jeder stirbt für sich allein',
                   'Lifeline',
                   'Lilith',
                   'Moving On',
                   'Protest',
                   'Shakedown',
                   'Shell Game',
                   'Six Bridges to Cross',
                   'South Pacific',
                   'Stakeout',
                   'The Accident',
                   'The Foxes of Harrow',
                   'The Gold Rush',
                   'The Magic Box',
                   'The Public Menace',
                   'The Racket',
                   'The Rainmaker',
                   'The Reunion',
                   'The Secret Storm',
                   'The Siege',
                   'The Switch',
                   'Untamed',
                   'Violence',
                   'War and Peace')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video movie')) AS t_filtered
JOIN cast_info AS ci ON t_filtered.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t_filtered.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t_filtered.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE n.gender IS NULL
  AND rt.role IN ('actress',
                   'composer',
                   'director',
                   'miscellaneous crew',
                   'producer')
  AND it1.id IN ('2')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND it2.id IN ('3')
  AND mi2.info IN ('Adventure',
                    'Animation',
                    'Drama',
                    'Family',
                    'Fantasy',
                    'Game-Show',
                    'Horror',
                    'Music',
                    'Mystery',
                    'Romance',
                    'Short',
                    'Sport',
                    'War',
                    'Western');