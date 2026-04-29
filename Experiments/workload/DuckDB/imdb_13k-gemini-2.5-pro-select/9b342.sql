WITH filtered_mi1 AS
  (SELECT movie_id,
          info
   FROM movie_info
   WHERE info_type_id IN ('3',
                  '4',
                  '5')
     AND info IN ('Romance',
                    'USA:Not Rated',
                    'USA:Passed',
                    'Western'))
SELECT fmi1.info,
       n.name,
       COUNT(*)
FROM filtered_mi1 AS fmi1
JOIN title AS t ON fmi1.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON fmi1.movie_id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi ON n.id = pi.person_id
WHERE t.production_year BETWEEN 1925 AND 1975
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
  AND rt.role IN ('actor',
                   'actress',
                   'cinematographer',
                   'composer',
                   'costume designer')
  AND n.name ILIKE '%piers%'
  AND pi.info_type_id IN ('36')
GROUP BY fmi1.info,
         n.name;