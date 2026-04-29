WITH filtered_persons AS
  (SELECT n.id,
          n.name
   FROM name AS n
   JOIN person_info AS pi ON n.id = pi.person_id
   WHERE n.name ILIKE '%le%'
     AND pi.info_type_id IN ('26')),
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
WHERE mi1.info_type_id IN ('5')
  AND mi1.info IN ('Argentina:Atp',
                    'Brazil:12',
                    'Canada:14',
                    'Italy:VM14',
                    'Peru:14',
                    'Peru:18',
                    'Singapore:PG',
                    'Spain:18',
                    'Sweden:15',
                    'UK:12',
                    'UK:PG',
                    'UK:X',
                    'West Germany:6')
  AND rt.role IN ('cinematographer',
                   'production designer',
                   'writer')
GROUP BY mi1.info,
         fp.name;