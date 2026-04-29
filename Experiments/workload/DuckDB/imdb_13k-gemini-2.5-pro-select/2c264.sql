WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 1975
     AND title IN ('(#1.33)',
                   '(#1.49)',
                   '(#1.60)',
                   '(#2.13)',
                   '(#4.8)',
                   '(#6.1)',
                   'A Dispatch from Reuters',
                   'A Farewell to Arms',
                   'A Friend in Need',
                   'A House Divided',
                   'Another World',
                   'Anything Goes',
                   'Best Foot Forward',
                   'Beyond a Reasonable Doubt',
                   'Crack-Up',
                   'El malvado Carabel',
                   'Escape',
                   'Follow the Boys',
                   'Föltámadott a tenger',
                   'Hostage',
                   'Jacqueline',
                   'Meet Me in St. Louis',
                   'Number 96',
                   'Paid in Full',
                   'Secrets',
                   'Stage Fright',
                   'Success Story',
                   'Terror',
                   'The Final Hour',
                   'The Hound of the Baskervilles',
                   'The Hunters',
                   'The Jackpot',
                   'The Professional',
                   'The Sea of Grass',
                   'Today',
                   'Vierter Teil')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('movie',
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
   WHERE ROLE IN ('composer',
                   'costume designer',
                   'writer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('1')
  AND mi2.info_type_id IN ('2')
  AND mi1.info IN ('100',
                    '107',
                    '59',
                    '90',
                    'UK:30',
                    'UK:50',
                    'USA:25',
                    'USA:90')
  AND mi2.info IN ('Black and White',
                    'Color');