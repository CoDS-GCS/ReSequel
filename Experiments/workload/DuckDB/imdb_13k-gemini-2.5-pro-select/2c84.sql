
SELECT COUNT(*)
FROM title AS t,
     cast_info AS ci,
     movie_info AS mi1,
     movie_info AS mi2
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.production_year <= 1975
  AND t.production_year >= 1875
  AND t.title IN ('(#1.41)',
                   '(#4.2)',
                   '(#4.29)',
                   '(#6.2)',
                   'Anastasia',
                   'Boy Meets Girl',
                   'Casino Royale',
                   'Dead Ringer',
                   'Doctors Wives',
                   'East Side, West Side',
                   'Jeanne Eagels',
                   'King of the Mountain',
                   'Merton of the Movies',
                   'Moral',
                   'No Place Like Home',
                   'Ride the Man Down',
                   'Saturdays Hero',
                   'Scared Stiff',
                   'Shoot to Kill',
                   'Stella',
                   'The Abominable Snowman',
                   'The Champ',
                   'The Exiles',
                   'The Human Comedy',
                   'The Lone Ranger Rides Again',
                   'The Woman in White',
                   'To Have and to Hold',
                   'Tonka',
                   'Whispering Smith')
  AND mi1.info_type_id IN ('18')
  AND mi1.info IN ('Buenos Aires, Federal District, Argentina',
                    'CBS Studio 50, New York City, New York, USA',
                    'Rome, Lazio, Italy',
                    'San Francisco, California, USA',
                    'Stage 22, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 7, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 9, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Walt Disney Studios, 500 South Buena Vista Street, Burbank, California, USA')
  AND mi2.info_type_id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv series',
                   'video game',
                   'video movie'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'costume designer',
                   'guest',
                   'production designer',
                   'writer'));