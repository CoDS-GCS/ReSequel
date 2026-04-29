WITH filtered_titles AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('tv movie',
                   'video game',
                   'video movie')),
     filtered_names AS
  (SELECT n.id,
          n.name
   FROM name AS n
   JOIN person_info AS pi ON n.id = pi.person_id
   JOIN info_type AS it2 ON pi.info_type_id = it2.id
   WHERE n.name ILIKE '%eng%'
     AND it2.id IN ('29'))
SELECT mi1.info,
       fn.name,
       COUNT(*)
FROM cast_info AS ci
JOIN filtered_titles AS ft ON ci.movie_id = ft.id
JOIN filtered_names AS fn ON ci.person_id = fn.id
JOIN movie_info AS mi1 ON ft.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE rt.role IN ('cinematographer',
                   'production designer',
                   'writer')
  AND it1.id IN ('3')
  AND mi1.info IN ('Biography',
                    'Fantasy',
                    'History',
                    'Horror',
                    'Musical',
                    'Mystery',
                    'News',
                    'Reality-TV',
                    'Romance',
                    'War')
GROUP BY mi1.info,
         fn.name;