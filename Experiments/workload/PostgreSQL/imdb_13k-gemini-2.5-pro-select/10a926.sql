WITH filtered_ci AS
  (SELECT ci.person_id,
          ci.movie_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE rt.role IN ('director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer')),
     filtered_mi AS
  (SELECT mi1.movie_id,
          mi1.info
   FROM movie_info AS mi1
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   WHERE it1.id IN ('2')
     AND mi1.info IN ('Black and White'))
SELECT n.name,
       fmi.info,
       MIN(t.production_year),
       MAX(t.production_year)
FROM name AS n
JOIN filtered_ci AS fci ON n.id = fci.person_id
JOIN filtered_mi AS fmi ON fci.movie_id = fmi.movie_id
JOIN title AS t ON fci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
WHERE n.name ILIKE '%sabri%'
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
GROUP BY n.name,
         fmi.info;