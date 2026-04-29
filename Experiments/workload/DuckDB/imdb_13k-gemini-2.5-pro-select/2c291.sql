WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 1975
     AND title IN ('(#1.27)',
                   '(#1.83)',
                   'Anna Christie',
                   'Artists and Models',
                   'Blockade',
                   'Brotherly Love',
                   'Chucho el Roto',
                   'Clive of India',
                   'Detective Story',
                   'If You Knew Susie',
                   'Jugovizija',
                   'Kabale und Liebe',
                   'Ladies Man',
                   'Of Human Bondage',
                   'One in a Million',
                   'Play School',
                   'Playmates',
                   'Quarta puntata',
                   'Spartacus',
                   'Stormy Weather',
                   'The Avengers',
                   'The Big Show',
                   'The Blue Knight',
                   'The Debt',
                   'The Devil Is Driving',
                   'The Kid',
                   'The Mikado',
                   'The Rescue',
                   'The Tell-Tale Heart',
                   'Vice Versa')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('tv movie',
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
   WHERE ROLE IN ('actor',
                   'actress',
                   'production designer',
                   'writer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('2')
  AND mi2.info_type_id IN ('5')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info IN ('Australia:G',
                    'Australia:PG',
                    'Germany:12',
                    'USA:Approved',
                    'USA:X',
                    'West Germany:12',
                    'West Germany:18');