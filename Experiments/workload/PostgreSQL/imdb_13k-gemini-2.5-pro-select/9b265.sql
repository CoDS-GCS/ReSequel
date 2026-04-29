WITH filtered_title_ids AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 2015
     AND kt.kind IN ('tv series',
                   'video game',
                   'video movie')),
     filtered_person_ids AS
  (SELECT n.id
   FROM name AS n
   JOIN person_info AS pi ON n.id = pi.person_id
   JOIN info_type AS it2 ON pi.info_type_id = it2.id
   WHERE n.name ILIKE '%sprin%'
     AND it2.id IN ('34'))
SELECT mi1.info,
       n.name,
       COUNT(*)
FROM cast_info AS ci
JOIN filtered_title_ids AS ft ON ci.movie_id = ft.id
JOIN filtered_person_ids AS fp ON ci.person_id = fp.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_info AS mi1 ON ci.movie_id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE it1.id IN ('4',
                  '6',
                  '8')
  AND mi1.info IN ('English')
  AND rt.role IN ('director',
                   'editor',
                   'miscellaneous crew',
                   'producer')
GROUP BY mi1.info,
         n.name;