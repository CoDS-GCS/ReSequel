WITH filtered_mi AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   WHERE mi1.info IN ('CAM:Panavision Cameras and Lenses',
                    'LAB:Technicolor',
                    'LAB:Technicolor, Hollywood (CA), USA',
                    'LAB:Technicolor, USA',
                    'PCS:Super 35',
                    'PFM:35 mm',
                    'PFM:70 mm')
     AND mi1.info_type_id IN ('7')),
     filtered_n AS
  (SELECT n.id
   FROM name AS n
   WHERE n.gender IS NULL
     AND n.surname_pcode IS NULL),
     filtered_cn AS
  (SELECT cn.id
   FROM company_name AS cn
   WHERE cn.name IN ('Metro-Goldwyn-Mayer (MGM)',
                   'Warner Home Video'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN filtered_mi AS mi ON t.id = mi.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN filtered_cn AS cn ON mc.company_id = cn.id
JOIN company_type AS ct ON mc.company_type_id = ct.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE t.production_year BETWEEN 1925 AND 1975
  AND kt.kind IN ('episode',
                   'movie')
  AND rt.role IN ('miscellaneous crew',
                   'producer')
  AND ct.kind IN ('distributors');