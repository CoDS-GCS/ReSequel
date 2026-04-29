WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1950 AND 1990
     AND title IN ('(#1.526)',
                   '(#1.738)',
                   '(#6.15)',
                   '(#6.2)',
                   'American Hot Wax',
                   'Birdy',
                   'Blind Spot',
                   'Crash',
                   'Eyewitness',
                   'Ghost of a Chance',
                   'Green Card',
                   'I Do, I Do',
                   'Killer',
                   'Mutiny',
                   'Protection',
                   'Take Me to Your Leader',
                   'The General',
                   'The Innocents',
                   'The Kid',
                   'The Raiders',
                   'The Son Also Rises',
                   'This Is Your Life',
                   'To Be or Not to Be',
                   'Trials',
                   'Trust')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actress'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('5')
  AND mi2.info_type_id IN ('2')
  AND mi1.info IN ('Canada:14A',
                    'Finland:K-12',
                    'Finland:K-18',
                    'Finland:K-8',
                    'Portugal:M/6',
                    'UK:A')
  AND mi2.info IN ('Black and White',
                    'Color');