WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1950 AND 1990
     AND title IN ('(#1.130)',
                   '(#1.268)',
                   '(#1.274)',
                   '(#1.338)',
                   '(#1.466)',
                   '(#1.621)',
                   '(#1.632)',
                   '(#1.679)',
                   '(#1.93)',
                   '(#2.45)',
                   '(#4.21)',
                   '(#9.22)',
                   'All in a Days Work',
                   'Childs Play',
                   'Cinématon',
                   'Comic Relief',
                   'Cover-Up',
                   'Der Rosenkavalier',
                   'Doomsday',
                   'Eight Men Out',
                   'Grand Theft Auto',
                   'Hot Line',
                   'Hot Money',
                   'Jeanne Eagels',
                   'König Drosselbart',
                   'La venganza de Don Mendo',
                   'Martha',
                   'Mutiny',
                   'Oedipus the King',
                   'Popples',
                   'Summer Holiday',
                   'The Carrier',
                   'The Duel',
                   'The Gunman',
                   'Victims',
                   'Young Doctors in Love')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'tv movie',
                   'tv series',
                   'video game'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'composer',
                   'director'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('2')
  AND mi2.info_type_id IN ('5')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info IN ('Argentina:16',
                    'Finland:K-18',
                    'UK:12',
                    'UK:15',
                    'UK:PG',
                    'USA:PG');