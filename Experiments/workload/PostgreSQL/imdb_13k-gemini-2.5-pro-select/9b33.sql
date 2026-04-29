WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game'))
SELECT mi1.info,
       n.name,
       COUNT(*)
FROM name AS n
JOIN person_info AS pi ON n.id = pi.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN filtered_movies AS fm ON ci.movie_id = fm.id
JOIN movie_info AS mi1 ON ci.movie_id = mi1.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE n.name ILIKE '%em%'
  AND pi.info_type_id IN ('21')
  AND ci.role_id = rt.id
  AND rt.role IN ('composer',
                   'production designer',
                   'writer')
  AND mi1.info_type_id IN ('2',
                  '3',
                  '5')
  AND mi1.info IN ('Argentina:Atp',
                    'Australia:MA15+',
                    'Brazil:Livre',
                    'Canada:14A',
                    'Finland:K-12',
                    'Finland:K-13',
                    'Finland:K-3',
                    'Germany:6',
                    'Netherlands:16',
                    'Portugal:M/12',
                    'UK:E',
                    'USA:E10+',
                    'USA:TV-G',
                    'USA:TV-Y7',
                    'Western')
GROUP BY mi1.info,
         n.name;