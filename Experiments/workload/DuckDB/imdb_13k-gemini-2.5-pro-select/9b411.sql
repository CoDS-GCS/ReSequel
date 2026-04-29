WITH filtered_mi1 AS
  (SELECT movie_id,
          info
   FROM movie_info
   WHERE info_type_id IN ('4',
                  '5')
     AND info IN ('Chile:14',
                    'Chile:TE',
                    'Finland:K-18',
                    'Germany:18',
                    'Germany:6',
                    'Germany:o.Al.',
                    'Hong Kong:III',
                    'Ireland:12A',
                    'Malaysia:U',
                    'Netherlands:AL',
                    'New Zealand:R18',
                    'Norway:11',
                    'Sweden:7',
                    'Turkish',
                    'USA:X'))
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
WHERE t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
  AND rt.role IN ('director',
                   'editor',
                   'miscellaneous crew',
                   'producer')
  AND n.name ILIKE '%laz%'
  AND pi.info_type_id IN ('39')
GROUP BY fmi1.info,
         n.name;