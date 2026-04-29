WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 1975
     AND title IN ('(#1.118)',
                   '(#1.123)',
                   '(#1.14)',
                   '(#4.16)',
                   '(#4.19)',
                   '(#4.3)',
                   '(#5.10)',
                   '(#5.28)',
                   '(#5.9)',
                   '(#7.14)',
                   '(#8.9)',
                   'Anna',
                   'Another Thin Man',
                   'Arabian Nights',
                   'Black Magic',
                   'Charleys Aunt',
                   'Dantes Inferno',
                   'Devdas',
                   'Escapade',
                   'Experiment Perilous',
                   'Friendly Persuasion',
                   'Glamour Boy',
                   'Gold',
                   'Heung gong chat sup sam',
                   'Hired Wife',
                   'Kidnap',
                   'Lost and Found',
                   'Madame Bovary',
                   'Mr. Skeffington',
                   'Notorious',
                   'Over the Wall',
                   'Rio Grande',
                   'Strange Cargo',
                   'The Bounty Hunter',
                   'The Bridge',
                   'The Cure',
                   'The Good Companions',
                   'The Great Waltz',
                   'The Masterpiece',
                   'The Visitor',
                   'Threes Company',
                   'Two Tickets to Broadway',
                   'Untamed',
                   'You and Me')
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
   WHERE gender IN ('f')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actress',
                   'director',
                   'production designer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('2')
  AND mi2.info_type_id IN ('17')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info IN ('Last show of the series.',
                    'One of over 700 Paramount Productions, filmed between 1929 and 1949, which were sold to MCA/Universal in 1958 for television distribution, and have been owned and controlled by Universal ever since.');