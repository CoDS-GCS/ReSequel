WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND kt.kind IN ('episode',
                   'movie',
                   'tv series'))
SELECT mi1.info,
       n.name,
       COUNT(*)
FROM name AS n
JOIN person_info AS pi ON n.id = pi.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN filtered_movies AS fm ON ci.movie_id = fm.id
JOIN movie_info AS mi1 ON ci.movie_id = mi1.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE n.name ILIKE '%mari%'
  AND pi.info_type_id IN ('19')
  AND ci.role_id = rt.id
  AND rt.role IN ('actress',
                   'costume designer',
                   'director',
                   'producer')
  AND mi1.info_type_id IN ('4',
                  '5',
                  '6')
  AND mi1.info IN ('Argentina:Atp',
                    'Czech',
                    'Danish',
                    'Finland:K-12',
                    'Finland:K-18',
                    'France:U',
                    'German',
                    'Germany:12',
                    'Germany:16',
                    'Iceland:16',
                    'Portugal:M/12',
                    'Singapore:PG',
                    'Spain:18',
                    'Spain:T',
                    'Spanish',
                    'Sweden:Btl',
                    'Swedish',
                    'UK:A',
                    'UK:PG',
                    'USA:R')
GROUP BY mi1.info,
         n.name;