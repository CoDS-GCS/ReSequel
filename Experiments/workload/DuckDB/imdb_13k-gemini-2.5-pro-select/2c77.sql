WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1950 AND 1990
     AND title IN ('(#1.125)',
                   '(#1.369)',
                   '(#1.491)',
                   '(#1.614)',
                   '(#1.71)',
                   'Annie Oakley',
                   'Beauty and the Beast',
                   'Brookside',
                   'Country Cousin',
                   'Ghost Story',
                   'Hemingway',
                   'Little Dorrit',
                   'Missing in Action',
                   'Money to Burn',
                   'Mozart',
                   'Sins of the Father',
                   'Sons and Daughters',
                   'The Big Parade of Comedy',
                   'The Black Stallion',
                   'The Haunting',
                   'The Promotion',
                   'Trading Places',
                   'World Wide Wrestling')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
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
   WHERE ROLE IN ('director'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('2')
  AND mi2.info_type_id IN ('8')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info IN ('Brazil',
                    'Finland',
                    'Italy',
                    'Poland',
                    'South Korea',
                    'UK');