WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1950 AND 1990
     AND title IN ('(#1.146)',
                   '(#1.155)',
                   '(#1.326)',
                   '(#1.70)',
                   'All-Star Party for Dutch Reagan',
                   'Anna',
                   'Cops and Robbers',
                   'Crime and Punishment',
                   'Das Vermächtnis',
                   'Hobsons Choice',
                   'Jacobs Ladder',
                   'Lionheart',
                   'Loophole',
                   'Monty Python and the Holy Grail',
                   'Part II',
                   'The Great Impostor',
                   'Twice Upon a Time')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('movie',
                   'tv movie',
                   'video game'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'editor',
                   'guest',
                   'production designer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('1')
  AND mi2.info_type_id IN ('3')
  AND mi1.info IN ('102',
                    '117',
                    '118',
                    '28',
                    '33',
                    '75',
                    'USA:30',
                    'USA:6')
  AND mi2.info IN ('Adult',
                    'Animation',
                    'Comedy',
                    'Documentary',
                    'Horror',
                    'Mystery',
                    'Romance',
                    'Short',
                    'Thriller',
                    'Western');