WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 1975
     AND t.title IN ('(#1.107)',
                   '(#1.2)',
                   '(#2.42)',
                   '(#3.10)',
                   '(#6.10)',
                   '(#7.8)',
                   '(#8.6)',
                   'A Likely Story',
                   'A Midsummer Nights Dream',
                   'A Place in the Sun',
                   'Anna Christie',
                   'Beatrice Cenci',
                   'Big Brother',
                   'Catspaw',
                   'Chance of a Lifetime',
                   'Court Martial',
                   'Erziehung vor Verdun. Der große Krieg der weißen Männer',
                   'Gabriela',
                   'Girl Crazy',
                   'Government Girl',
                   'I Dood It',
                   'Iceland',
                   'Justice',
                   'Leuchtfeuer',
                   'Love and Marriage',
                   'Love of Life',
                   'My Fair Lady',
                   'Notorious',
                   'One Foot in Heaven',
                   'Second Honeymoon',
                   'She Gets Her Man',
                   'Si Versailles métait conté',
                   'The Accident',
                   'The Desert Hawk',
                   'The Executioners',
                   'The Front Page',
                   'The Honeymoon',
                   'The Inside Man',
                   'The Mark of Cain',
                   'The One That Got Away',
                   'The Public Menace',
                   'The Quick and the Dead',
                   'The Taming of the Shrew',
                   'They Died with Their Boots On',
                   'Yankee Doodle Dandy')
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
WHERE n.gender IN ('f')
  AND rt.role IN ('actress',
                   'guest',
                   'miscellaneous crew',
                   'producer',
                   'production designer')
  AND it1.id IN ('6')
  AND mi1.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'Mono',
                    'Silent',
                    'Stereo')
  AND it2.id IN ('3')
  AND mi2.info IN ('Action',
                    'Biography',
                    'Crime',
                    'Drama',
                    'Family',
                    'Mystery',
                    'Romance',
                    'War');