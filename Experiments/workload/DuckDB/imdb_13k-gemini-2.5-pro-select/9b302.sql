WITH filtered_movies AS
  (SELECT t.id,
          mi1.info
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   WHERE t.production_year BETWEEN 1925 AND 2015
     AND kt.kind IN ('tv movie',
                   'tv series',
                   'video movie')
     AND mi1.info_type_id IN ('5',
                  '6',
                  '8')
     AND mi1.info IN ('Argentina',
                    'Australia:M',
                    'Brazil:Livre',
                    'Canada:G',
                    'Finland:K-18',
                    'Iceland:16',
                    'Japan',
                    'Netherlands:AL',
                    'South Korea:15',
                    'UK:12'))
SELECT fm.info,
       n.name,
       COUNT(*)
FROM name AS n
JOIN person_info AS pi ON n.id = pi.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN filtered_movies AS fm ON ci.movie_id = fm.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE n.name ILIKE '%do%'
  AND pi.info_type_id IN ('37')
  AND rt.role IN ('cinematographer',
                   'composer',
                   'editor',
                   'production designer')
GROUP BY fm.info,
         n.name;