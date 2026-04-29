WITH filtered_movies AS
  (SELECT t.id,
          mi1.info
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
     AND mi1.info_type_id IN ('4',
                  '5')
     AND mi1.info IN ('Australia:M',
                    'Canada:G',
                    'Czech',
                    'Finland:K-16',
                    'Hungarian',
                    'Netherlands:6',
                    'Norway:16',
                    'Slovak',
                    'Sweden:15',
                    'UK:PG',
                    'USA:TV-G',
                    'West Germany:12'))
SELECT fm.info,
       n.name,
       COUNT(*)
FROM name AS n
JOIN person_info AS pi ON n.id = pi.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN filtered_movies AS fm ON ci.movie_id = fm.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE n.name ILIKE '%ma%'
  AND pi.info_type_id IN ('29')
  AND rt.role IN ('costume designer',
                   'director',
                   'producer')
GROUP BY fm.info,
         n.name;