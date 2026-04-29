WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 1975
     AND title IN ('(#1.67)',
                   '(#1.91)',
                   '(#2.2)',
                   '(#2.42)',
                   '(#3.34)',
                   'A Night at the Opera',
                   'Anniversary',
                   'Black Gold',
                   'Countdown',
                   'Crime of Passion',
                   'Die große Chance',
                   'Hot Money',
                   'Man Hunt',
                   'Monty Python and the Holy Grail',
                   'No Place Like Home',
                   'Pack Up Your Troubles',
                   'Parnell',
                   'Part 6',
                   'San Quentin',
                   'School Days',
                   'Sesame Street',
                   'Stella',
                   'Success Story',
                   'The Auction',
                   'The Charge of the Light Brigade',
                   'The Lone Ranger',
                   'The Meeting',
                   'The Professional',
                   'The Spoilers',
                   'Tiger by the Tail',
                   'Tower of London',
                   'Whiplash',
                   'Yankee Doodle Dandy')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actress',
                   'composer',
                   'editor',
                   'guest'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('2')
  AND mi2.info_type_id IN ('3')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info IN ('Biography',
                    'Comedy',
                    'Musical',
                    'Sport',
                    'War',
                    'Western');