WITH filtered_t AS
  (SELECT t.id
   FROM title AS t
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND t.title IN ('(#1.112)',
                   '(#1.76)',
                   '(#3.6)',
                   '(#5.21)',
                   '2001: A Space Odyssey',
                   'Black Bart',
                   'Chûshingura',
                   'Die Fledermaus',
                   'If You Knew Susie',
                   'Karussell',
                   'Kvartetten som sprängdes',
                   'La cieca di Sorrento',
                   'Stingaree',
                   'The Awakening',
                   'The Barrier',
                   'The Clock',
                   'The Executioners',
                   'The Great Train Robbery',
                   'The Plunderers',
                   'The Verdict')
     AND t.kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
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
                   'cinematographer',
                   'director',
                   'editor')
  AND mi1.info_type_id IN ('2')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info_type_id IN ('5')
  AND mi2.info IN ('Finland:K-16',
                    'Norway:16',
                    'Sweden:11',
                    'UK:X',
                    'USA:R',
                    'USA:TV-G',
                    'USA:TV-PG',
                    'USA:X');