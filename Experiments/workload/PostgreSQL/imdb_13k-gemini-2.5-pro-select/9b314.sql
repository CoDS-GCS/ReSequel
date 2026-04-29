WITH filtered_persons AS
  (SELECT n.id,
          n.name
   FROM name AS n
   JOIN person_info AS pi ON n.id = pi.person_id
   WHERE n.name ILIKE '%pott%'
     AND pi.info_type_id IN ('28')),
     filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND kt.kind IN ('episode',
                   'movie'))
SELECT mi1.info,
       fp.name,
       COUNT(*)
FROM cast_info AS ci
JOIN filtered_persons AS fp ON ci.person_id = fp.id
JOIN filtered_movies AS fm ON ci.movie_id = fm.id
JOIN movie_info AS mi1 ON ci.movie_id = mi1.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE mi1.info_type_id IN ('4',
                  '5',
                  '8')
  AND mi1.info IN ('Australia:G',
                    'Australia:M',
                    'Australia:PG',
                    'Iceland:16',
                    'Iceland:L',
                    'UK:15',
                    'UK:18',
                    'UK:PG')
  AND rt.role IN ('actor',
                   'cinematographer',
                   'composer',
                   'costume designer')
GROUP BY mi1.info,
         fp.name;