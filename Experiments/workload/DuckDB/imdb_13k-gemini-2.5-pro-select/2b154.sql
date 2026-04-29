WITH mi1_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('8')
     AND mi.info IN ('USA')),
     mi2_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('105')
     AND mi.info IN ('$1,000,000',
                    '$1,500',
                    '$100',
                    '$150,000',
                    '$200',
                    '$200,000',
                    '$250,000',
                    '$500,000'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN mi1_filtered mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1950 AND 2010
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND rt.role IN ('producer')
  AND n.gender IN ('m')
  AND k.keyword IN ('end-times',
                     'jumping-onto-someone',
                     'karmelman',
                     'old-vs.-new',
                     'reference-to-the-hunger-games',
                     'rolling-down-a-hill');