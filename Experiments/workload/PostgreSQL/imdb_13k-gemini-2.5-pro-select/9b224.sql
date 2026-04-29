WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 1975
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie'))
SELECT mi1.info,
       n.name,
       COUNT(*)
FROM name AS n
JOIN person_info AS pi ON n.id = pi.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN filtered_movies AS fm ON ci.movie_id = fm.id
JOIN movie_info AS mi1 ON ci.movie_id = mi1.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE n.name ILIKE '%jea%'
  AND pi.info_type_id IN ('38')
  AND ci.role_id = rt.id
  AND rt.role IN ('actor',
                   'actress',
                   'costume designer')
  AND mi1.info_type_id IN ('4',
                  '6')
  AND mi1.info IN ('70 mm 6-Track',
                    'Danish',
                    'Filipino',
                    'Latin',
                    'Mandarin',
                    'Romanian',
                    'Russian',
                    'Swedish',
                    'Tagalog')
GROUP BY mi1.info,
         n.name;