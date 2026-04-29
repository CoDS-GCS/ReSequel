WITH filtered_persons AS
  (SELECT n.id,
          n.name
   FROM name AS n
   JOIN person_info AS pi ON n.id = pi.person_id
   WHERE n.name ILIKE '%ko%'
     AND pi.info_type_id IN ('19')),
     filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 2015
     AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game'))
SELECT mi1.info,
       fp.name,
       COUNT(*)
FROM cast_info AS ci
JOIN filtered_persons AS fp ON ci.person_id = fp.id
JOIN filtered_movies AS fm ON ci.movie_id = fm.id
JOIN movie_info AS mi1 ON ci.movie_id = mi1.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE mi1.info_type_id IN ('3',
                  '5')
  AND mi1.info IN ('Action',
                    'Australia:M',
                    'Drama',
                    'Iceland:12',
                    'Iceland:16',
                    'Mystery',
                    'Netherlands:12',
                    'Reality-TV',
                    'USA:E',
                    'USA:E10+',
                    'USA:Not Rated',
                    'USA:PG-13',
                    'USA:T')
  AND rt.role IN ('cinematographer',
                   'composer',
                   'editor',
                   'production designer',
                   'writer')
GROUP BY mi1.info,
         fp.name;