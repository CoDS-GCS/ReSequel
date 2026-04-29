WITH filtered_movies AS
  (SELECT t.id,
          mi1.info
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
     AND mi1.info_type_id IN ('3',
                  '5',
                  '6')
     AND mi1.info IN ('Brazil:16',
                    'Finland:K-18',
                    'Germany:18',
                    'Hong Kong:IIA',
                    'Ireland:12A',
                    'Musical',
                    'Peru:14',
                    'Philippines:PG-13',
                    'Singapore:PG13',
                    'UK:12A',
                    'UK:U',
                    'USA:Not Rated'))
SELECT fm.info,
       n.name,
       COUNT(*)
FROM name AS n
JOIN person_info AS pi ON n.id = pi.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN filtered_movies AS fm ON ci.movie_id = fm.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE n.name ILIKE '%hud%'
  AND pi.info_type_id IN ('24')
  AND rt.role IN ('actress',
                   'composer',
                   'costume designer')
GROUP BY fm.info,
         n.name;