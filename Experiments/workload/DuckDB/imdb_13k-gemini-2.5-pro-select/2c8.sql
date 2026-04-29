WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 1975
     AND title IN ('(#1.125)',
                   '(#1.82)',
                   '(#4.17)',
                   '(#4.31)',
                   '(#6.11)',
                   '(#6.15)',
                   '(#7.15)',
                   'A Canterbury Tale',
                   'A Farewell to Arms',
                   'A Life of Her Own',
                   'An American in Paris',
                   'Beauty and the Beast',
                   'Die Ratten',
                   'Hurricane',
                   'Killer McCoy',
                   'Les mystères de Paris',
                   'Maya',
                   'Meet John Doe',
                   'Mrs. Parkington',
                   'One Good Turn',
                   'San Quentin',
                   'Secret Agent X-9',
                   'Small Town Girl',
                   'Smart Woman',
                   'Storm Warning',
                   'Tennessee Johnson',
                   'The Barretts of Wimpole Street',
                   'The Daring Young Man',
                   'The Dream',
                   'The Frame-Up',
                   'The Great Caruso',
                   'The Roaring Twenties',
                   'The Three Musketeers',
                   'The Whole Towns Talking',
                   'Up Front',
                   'Vengeance')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('tv movie',
                   'tv series'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'cinematographer',
                   'director',
                   'guest',
                   'production designer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('2')
  AND mi2.info_type_id IN ('6')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info IN ('Mono',
                    'Silent',
                    'Stereo');