WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND kt.kind IN ('episode',
                   'movie'))
SELECT mi1.info,
       n.name,
       COUNT(*)
FROM name AS n
JOIN person_info AS pi ON n.id = pi.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN filtered_movies AS fm ON ci.movie_id = fm.id
JOIN movie_info AS mi1 ON ci.movie_id = mi1.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE n.name ILIKE '%re%'
  AND pi.info_type_id IN ('38')
  AND ci.role_id = rt.id
  AND rt.role IN ('costume designer',
                   'director',
                   'miscellaneous crew')
  AND mi1.info_type_id IN ('3',
                  '4',
                  '5')
  AND mi1.info IN ('Australia:X',
                    'Belgium:16',
                    'Belgium:KNT',
                    'Belgium:KT',
                    'Brazil:10',
                    'Catalan',
                    'Denmark:12',
                    'Finland:K-11',
                    'Hong Kong:IIA',
                    'Ireland:15',
                    'Mandarin',
                    'Netherlands:MG6',
                    'New Zealand:(Banned)',
                    'Poland:15',
                    'Slovak',
                    'Spain:7',
                    'Telugu',
                    'West Germany:o.Al.',
                    'Yiddish')
GROUP BY mi1.info,
         n.name;