WITH filtered_t AS
  (SELECT t.id
   FROM title AS t
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND t.title IN ('(#1.72)',
                   '(#3.16)',
                   '(#7.2)',
                   'Bedtime Story',
                   'Friendly Persuasion',
                   'Jugovizija',
                   'Letter of Introduction',
                   'Rio Rita',
                   'The Crowd Roars',
                   'Time Lock')
     AND t.kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv series',
                   'video game')))
SELECT COUNT(*)
FROM filtered_t
JOIN cast_info AS ci ON filtered_t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON filtered_t.id = mi1.movie_id
JOIN movie_info AS mi2 ON filtered_t.id = mi2.movie_id
WHERE n.gender IS NULL
  AND rt.role IN ('actress',
                   'composer',
                   'costume designer',
                   'director',
                   'miscellaneous crew')
  AND mi1.info_type_id IN ('5')
  AND mi1.info IN ('Argentina:16',
                    'Australia:G',
                    'Australia:M',
                    'Portugal:M/12',
                    'Spain:13',
                    'Sweden:15',
                    'UK:A',
                    'USA:Approved',
                    'USA:Unrated')
  AND mi2.info_type_id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color');