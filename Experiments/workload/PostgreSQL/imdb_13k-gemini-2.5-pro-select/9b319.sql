WITH filtered_ci AS
  (SELECT ci.movie_id,
          ci.person_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE rt.role IN ('actress',
                   'director',
                   'miscellaneous crew',
                   'producer'))
SELECT mi1.info,
       n.name,
       COUNT(*)
FROM filtered_ci AS fci
JOIN title AS t ON fci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON fci.movie_id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN name AS n ON fci.person_id = n.id
JOIN person_info AS pi ON n.id = pi.person_id
JOIN info_type AS it2 ON pi.info_type_id = it2.id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('tv movie',
                   'video game',
                   'video movie')
  AND it1.id IN ('2',
                  '3')
  AND mi1.info IN ('Animation',
                    'Biography',
                    'Crime',
                    'History',
                    'Horror',
                    'Musical',
                    'Mystery',
                    'Sci-Fi',
                    'Sport',
                    'Talk-Show')
  AND n.name ILIKE '%zo%'
  AND it2.id IN ('26')
GROUP BY mi1.info,
         n.name;