WITH filtered_t AS
  (SELECT t.id
   FROM title AS t
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND t.title IN ('(#5.12)',
                   '(#6.14)',
                   'Because of You',
                   'Beyond Our Control',
                   'Cover Girl',
                   'Glamour Boy',
                   'Kean',
                   'Kid Galahad',
                   'La dolce vita',
                   'Macbeth',
                   'Part 6',
                   'Suspicion',
                   'The Desert Fox: The Story of Rommel',
                   'The Final Test',
                   'The Gamblers',
                   'The Hunted',
                   'This Is the Army',
                   'Tiger by the Tail',
                   'True Confession')
     AND t.kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')))
SELECT COUNT(*)
FROM filtered_t
JOIN cast_info AS ci ON filtered_t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON filtered_t.id = mi1.movie_id
JOIN movie_info AS mi2 ON filtered_t.id = mi2.movie_id
WHERE n.gender IS NULL
  AND rt.role IN ('actor',
                   'producer',
                   'production designer',
                   'writer')
  AND mi1.info_type_id IN ('4')
  AND mi1.info IN ('Bengali',
                    'Bulgarian',
                    'Czech',
                    'Dutch',
                    'Finnish',
                    'German',
                    'Italian',
                    'Japanese',
                    'Korean',
                    'None',
                    'Persian',
                    'Polish',
                    'Tagalog',
                    'Telugu')
  AND mi2.info_type_id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color');