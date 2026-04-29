WITH filtered_mi1 AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   WHERE mi1.info_type_id IN ('2')
     AND mi1.info IN ('Black and White',
                    'Color')),
     filtered_mi2 AS
  (SELECT mi2.movie_id
   FROM movie_info AS mi2
   WHERE mi2.info_type_id IN ('7')
     AND mi2.info IN ('MET:120 m',
                    'MET:15.2 m',
                    'MET:15.24 m',
                    'MET:150 m',
                    'MET:30 m',
                    'PFM:68 mm',
                    'RAT:1.33 : 1',
                    'RAT:1.66 : 1'))
SELECT COUNT(*)
FROM title AS t
JOIN filtered_mi1 ON t.id = filtered_mi1.movie_id
JOIN filtered_mi2 ON t.id = filtered_mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN kind_type AS kt ON t.kind_id = kt.id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND t.title IN ('(#1.116)',
                   '(#1.71)',
                   '(#1.93)',
                   '(#3.32)',
                   '(#6.13)',
                   'Airport',
                   'Arashi o yobu otoko',
                   'Backfire',
                   'Brigadoon',
                   'Down to the Sea in Ships',
                   'If I Were King',
                   'Jenny',
                   'Kabale und Liebe',
                   'Macbeth',
                   'Man on the Run',
                   'Music Hath Charms',
                   'No Escape',
                   'Pride and Prejudice',
                   'Search for Tomorrow',
                   'Svadba',
                   'The Arrangement',
                   'The Beginning or the End',
                   'The Countess',
                   'The King of Kings',
                   'The Other Man',
                   'The Passenger',
                   'The Prodigal',
                   'The Savage',
                   'The Second Time Around',
                   'The Substitute',
                   'Unser Sandmännchen',
                   'Washington Story',
                   'Woman to Woman',
                   'World Wide Wrestling')
  AND (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND rt.role IN ('actor',
                   'cinematographer',
                   'director',
                   'writer')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv series',
                   'video game');