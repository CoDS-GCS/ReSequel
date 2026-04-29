WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1875 AND 1975
     AND title IN ('(#1.78)',
                   'Exposed',
                   'Johnny Belinda',
                   'Linda',
                   'Love Letters',
                   'Safari',
                   'Somerset',
                   'Take Me Out to the Ball Game',
                   'Target',
                   'The Alibi',
                   'The Blue Bird',
                   'The Replacement',
                   'The Silver Chalice',
                   'The Texas Rangers',
                   'The Threat',
                   'Welcome Stranger')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('movie',
                   'tv movie',
                   'video game'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('writer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('4')
  AND mi2.info_type_id IN ('18')
  AND mi1.info IN ('Czech',
                    'Dutch',
                    'English',
                    'Filipino',
                    'Finnish',
                    'French',
                    'Latin',
                    'Mandarin',
                    'Polish',
                    'Spanish',
                    'Swedish',
                    'Tagalog')
  AND mi2.info IN ('CBS Studio 50, New York City, New York, USA',
                    'Desilu Studios - 9336 W. Washington Blvd., Culver City, California, USA',
                    'Iverson Ranch - 1 Iverson Lane, Chatsworth, Los Angeles, California, USA',
                    'Mexico City, Distrito Federal, Mexico',
                    'Republic Studios - 4024 Radford Avenue, North Hollywood, Los Angeles, California, USA');