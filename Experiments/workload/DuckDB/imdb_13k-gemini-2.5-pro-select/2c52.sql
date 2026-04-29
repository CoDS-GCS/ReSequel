
SELECT COUNT(*)
FROM
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1975 AND 2015
     AND title IN ('(#1.1238)',
                   '(#1.3398)',
                   '(#1.5304)',
                   '(#1.640)',
                   '(#1.999)',
                   '(2002-06-04)',
                   '(2011-08-05)',
                   '(2013-01-05)',
                   '1974',
                   'Amazons',
                   'Area 51',
                   'Chapter 19',
                   'Comic Relief 2007: The Big One',
                   'Cop Games',
                   'Facade',
                   'Head Games',
                   'Heavy Metal',
                   'Hesher',
                   'Johnny',
                   'Lethal Weapon 2',
                   'Man of the House',
                   'Medal of Honor: Rising Sun',
                   'Mejor que nunca',
                   'Neue Hoffnung',
                   'Rascals',
                   'Ripple Effect',
                   'Running Home',
                   'Silent Hill: Revelation 3D',
                   'The Cake',
                   'The Man That Got Away',
                   'WWE Hall of Fame 2007',
                   'Wait')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie'))) AS t
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
                   'director',
                   'production designer',
                   'writer')) AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('8')
  AND mi1.info IN ('Bangladesh',
                    'Luxembourg',
                    'Nepal',
                    'Soviet Union',
                    'Switzerland',
                    'USA',
                    'Uruguay')
  AND mi2.info_type_id IN ('3')
  AND mi2.info IN ('Animation',
                    'Drama',
                    'Fantasy',
                    'Music',
                    'Reality-TV',
                    'Short',
                    'Sport',
                    'War');