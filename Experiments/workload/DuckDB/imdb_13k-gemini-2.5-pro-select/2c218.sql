WITH filtered_t AS
  (SELECT t.id
   FROM title AS t
   WHERE t.production_year BETWEEN 1925 AND 1975
     AND t.title IN ('(#1.11)',
                   '(#1.17)',
                   '(#1.85)',
                   '(#3.43)',
                   '(#5.27)',
                   'A Piece of the Action',
                   'Accidents Will Happen',
                   'Born to Sing',
                   'Carrie',
                   'College Holiday',
                   'Cornered',
                   'Der Rosenkavalier',
                   'Diane',
                   'East Side, West Side',
                   'Exposed',
                   'Forbidden',
                   'Forever and a Day',
                   'Glückspilze',
                   'God Is My Co-Pilot',
                   'Jigsaw',
                   'La porteuse de pain',
                   'Les trois mousquetaires',
                   'Maratón',
                   'Roughly Speaking',
                   'Scandal Sheet',
                   'Seishun to wa nanda',
                   'Sing a Song of Murder',
                   'Springtime in the Rockies',
                   'Stagecoach',
                   'Stand Up and Be Counted',
                   'The Bait',
                   'The Big Night',
                   'The Circus',
                   'The Decision',
                   'The Facts of Life',
                   'The Final Hour',
                   'The Greatest Show on Earth',
                   'The Hard Way',
                   'The Taming of the Shrew',
                   'The Turning Point',
                   'The Visitor',
                   'Thérèse Raquin',
                   'Yankee Doodle Dandy')
     AND t.kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('movie',
                   'tv movie',
                   'tv series',
                   'video movie')))
SELECT COUNT(*)
FROM filtered_t
JOIN cast_info AS ci ON filtered_t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON filtered_t.id = mi1.movie_id
JOIN movie_info AS mi2 ON filtered_t.id = mi2.movie_id
WHERE n.gender IS NULL
  AND rt.role IN ('costume designer')
  AND mi1.info_type_id IN ('18')
  AND mi1.info IN ('20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Acapulco, Guerrero, Mexico',
                    'Bavaria Filmstudios, Geiselgasteig, Grünwald, Bavaria, Germany',
                    'Corriganville, Ray Corrigan Ranch, Simi Valley, California, USA',
                    'Hal Roach Studios - 8822 Washington Blvd., Culver City, California, USA',
                    'Hong Kong, China',
                    'Los Angeles, California, USA',
                    'Madrid, Spain',
                    'Manhattan, New York City, New York, USA',
                    'Mexico City, Distrito Federal, Mexico',
                    'Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Paris, France',
                    'San Francisco, California, USA',
                    'Universal Studios - 100 Universal City Plaza, Universal City, California, USA')
  AND mi2.info_type_id IN ('3')
  AND mi2.info IN ('Adventure',
                    'Comedy',
                    'History',
                    'Musical',
                    'Mystery',
                    'Sci-Fi',
                    'Sport',
                    'Thriller',
                    'Western');