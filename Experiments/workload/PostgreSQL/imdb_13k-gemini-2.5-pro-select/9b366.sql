WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 2015
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
WHERE n.name ILIKE '%fred%'
  AND pi.info_type_id IN ('29')
  AND ci.role_id = rt.id
  AND rt.role IN ('director',
                   'editor',
                   'producer',
                   'production designer')
  AND mi1.info_type_id IN ('4',
                  '5')
  AND mi1.info IN ('Argentina:18',
                    'Argentina:Atp',
                    'Australia:MA',
                    'Canada:PG',
                    'Finland:(Banned)',
                    'Italian',
                    'Italy:T',
                    'Netherlands:AL',
                    'Portugal:M/16',
                    'Singapore:M18',
                    'South Korea:12',
                    'South Korea:15',
                    'South Korea:18',
                    'Spain:18',
                    'UK:12',
                    'UK:A',
                    'UK:PG',
                    'USA:PG',
                    'USA:TV-G')
GROUP BY mi1.info,
         n.name;