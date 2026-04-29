WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 1975
     AND title IN ('(#1.47)',
                   '(#1.71)',
                   '(#2.7)',
                   '(#3.34)',
                   '(#5.9)',
                   'A Likely Story',
                   'After the Thin Man',
                   'All Star Comedy Carnival',
                   'Blazing Saddles',
                   'Caravan',
                   'Chain of Events',
                   'Decision Before Dawn',
                   'For Better, for Worse',
                   'Honky Tonk',
                   'Like Father, Like Son',
                   'Mandrin',
                   'Second Chance',
                   'The Big Night',
                   'The Big Shot',
                   'The Gold Rush',
                   'The Green Hornet',
                   'The Mummy',
                   'The Prize')
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
   WHERE ROLE IN ('costume designer',
                   'director',
                   'editor',
                   'guest',
                   'producer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('4')
  AND mi2.info_type_id IN ('1')
  AND mi1.info IN ('Czech',
                    'English',
                    'German',
                    'Italian',
                    'Mandarin',
                    'Persian',
                    'Portuguese')
  AND mi2.info IN ('15',
                    '6',
                    '70',
                    '73',
                    '96',
                    '99');