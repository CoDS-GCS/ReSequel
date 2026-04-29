WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 1975
     AND t.title IN ('(#1.113)',
                   'Borderline',
                   'For Love or Money',
                   'Is There Sex After Death?',
                   'Jailbreak',
                   'Little Egypt',
                   'The Condemned',
                   'The Last Man',
                   'The Matchmakers',
                   'The Song of Bernadette',
                   'Vendetta')
     AND kt.kind IN ('movie',
                   'tv movie',
                   'tv series'))
SELECT COUNT(*)
FROM filtered_movies AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE n.gender IN ('m')
  AND rt.role IN ('actress',
                   'director',
                   'miscellaneous crew',
                   'writer')
  AND it1.id IN ('5')
  AND mi1.info IN ('Argentina:13',
                    'Argentina:16',
                    'Canada:G',
                    'Finland:K-18',
                    'Spain:13',
                    'UK:15',
                    'USA:X')
  AND it2.id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color');