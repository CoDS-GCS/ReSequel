
SELECT mi1.info,
       n.name,
       COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi ON n.id = pi.person_id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN info_type AS it2 ON pi.info_type_id = it2.id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND rt.role IN ('actress',
                   'director',
                   'miscellaneous crew',
                   'producer')
  AND it1.id IN ('4')
  AND it2.id IN ('33')
  AND mi1.info IN ('Cantonese',
                    'Czech',
                    'Georgian',
                    'Greek',
                    'Korean',
                    'Mandarin',
                    'Norwegian',
                    'Persian',
                    'Romanian',
                    'Serbian',
                    'Tamil',
                    'Urdu')
  AND n.name ILIKE '%san%'
GROUP BY mi1.info,
         n.name;