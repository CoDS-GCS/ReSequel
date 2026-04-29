WITH filtered_movies AS
  (SELECT t.id,
          mi1.info
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND kt.kind IN ('episode',
                   'movie',
                   'tv series')
     AND mi1.info_type_id IN ('2',
                  '4')
     AND mi1.info IN ('Afrikaans',
                    'Albanian',
                    'Armenian',
                    'Catalan',
                    'Croatian',
                    'Latin',
                    'Macedonian',
                    'Marathi',
                    'None',
                    'Oriya',
                    'Persian',
                    'Serbian',
                    'Tamil',
                    'Turkish',
                    'Urdu',
                    'Vietnamese'))
SELECT fm.info,
       n.name,
       COUNT(*)
FROM name AS n
JOIN person_info AS pi ON n.id = pi.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN filtered_movies AS fm ON ci.movie_id = fm.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE n.name ILIKE '%go%'
  AND pi.info_type_id IN ('34')
  AND rt.role IN ('cinematographer',
                   'composer',
                   'writer')
GROUP BY fm.info,
         n.name;