WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND t.title IN ('(#1.246)',
                   '(#1.503)',
                   '(#1.539)',
                   '(#1.576)',
                   '(#1.681)',
                   '(#5.34)',
                   'Black Widow',
                   'Breaking Up Is Hard to Do',
                   'Buffalo Bills vs. New York Jets',
                   'Cinématon',
                   'Dark Angel',
                   'Dear Mom and Dad',
                   'Decision',
                   'Del 3',
                   'Die Zauberflöte',
                   'Don Carlo',
                   'Feelings',
                   'George Washington',
                   'His Brothers Keeper',
                   'Its a Dogs Life',
                   'Just Friends',
                   'King of New York',
                   'La traviata',
                   'Licence to Kill',
                   'Noblesse Oblige',
                   'Part 7',
                   'Perfect',
                   'Pinocchio',
                   'Power',
                   'Scorpion',
                   'South Pacific',
                   'Taken for a Ride',
                   'The Deadly Game',
                   'The Enemy Within',
                   'The Great Impostor',
                   'The Legend of Sleepy Hollow',
                   'The More You Know',
                   'The Rack',
                   'The Reporter',
                   'The Set-Up',
                   'The Widow',
                   'The Woman',
                   'Till Death Do Us Part',
                   'Trio')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
SELECT COUNT(*)
FROM filtered_movies AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE n.gender IN ('f',
                    'm')
  AND rt.role IN ('actress')
  AND it1.id IN ('18')
  AND mi1.info IN ('Bavaria Filmstudios, Geiselgasteig, Grünwald, Bavaria, Germany',
                    'Desilu Studios - 9336 W. Washington Blvd., Culver City, California, USA',
                    'Lisbon, Portugal',
                    'Los Angeles, California, USA',
                    'San Francisco, California, USA',
                    'Stage 18, Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Stage 28, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 8, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Stage 9, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA')
  AND it2.id IN ('4')
  AND mi2.info IN ('Arabic',
                    'Danish',
                    'French',
                    'German',
                    'Greek',
                    'Hindi',
                    'Japanese',
                    'Mandarin',
                    'Spanish');