WITH filtered_persons AS
  (SELECT n.id AS person_id
   FROM name AS n
   JOIN aka_name AS an ON n.id = an.person_id
   JOIN person_info AS pi1 ON n.id = pi1.person_id
   WHERE (n.gender IN ('m')
          OR n.gender IS NULL)
     AND n.name_pcode_nf IN ('A6543',
                           'B6535',
                           'G5362',
                           'G6535',
                           'J2346',
                           'J6525',
                           'L2416',
                           'M2563',
                           'M3262',
                           'R2616',
                           'R5432',
                           'S2153',
                           'V3656')
     AND pi1.info_type_id IN ('22'))
SELECT COUNT(*)
FROM filtered_persons AS fp
JOIN cast_info AS ci ON fp.person_id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN title AS t ON ci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
WHERE (ci.note IN ('(production assistant)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'miscellaneous crew')
  AND kt.kind IN ('episode',
                   'movie')
  AND t.production_year BETWEEN 1975 AND 2015
  AND mi1.info_type_id IN ('11',
                  '16',
                  '7')
  AND mi1.info IN ('CAM:Panavision Cameras and Lenses',
                    'OFM:16 mm',
                    'PCS:Digital Intermediate',
                    'PFM:16 mm',
                    'PFM:Video',
                    'RAT:1.37 : 1',
                    'RAT:1.66 : 1',
                    'RAT:1.78 : 1 / (high definition)')
  AND mii1.info_type_id = '100'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float BETWEEN 1000.0 AND 10000.0
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float BETWEEN 2.0 AND 5.0;