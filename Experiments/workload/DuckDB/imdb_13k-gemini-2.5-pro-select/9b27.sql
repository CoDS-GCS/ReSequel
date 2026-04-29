WITH filtered_movies AS
  (SELECT t.id,
          mi1.info
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('tv series',
                   'video game',
                   'video movie')
     AND it1.id IN ('3')
     AND mi1.info IN ('Action',
                    'Adult',
                    'Animation',
                    'Documentary',
                    'Drama',
                    'Family',
                    'Horror',
                    'Music',
                    'Romance',
                    'Short',
                    'Thriller')),
     filtered_persons AS
  (SELECT n.id,
          n.name
   FROM name AS n
   JOIN person_info AS pi ON n.id = pi.person_id
   JOIN info_type AS it2 ON pi.info_type_id = it2.id
   WHERE n.name ILIKE '%alb%'
     AND it2.id IN ('15'))
SELECT fm.info,
       fp.name,
       COUNT(*)
FROM cast_info AS ci
JOIN filtered_movies AS fm ON ci.movie_id = fm.id
JOIN filtered_persons AS fp ON ci.person_id = fp.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE rt.role IN ('editor',
                   'miscellaneous crew',
                   'producer')
GROUP BY fm.info,
         fp.name;