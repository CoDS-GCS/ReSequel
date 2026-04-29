
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
JOIN info_type AS it3 ON mii1.info_type_id = it3.id
JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
JOIN info_type AS it4 ON mii2.info_type_id = it4.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it5 ON pi1.info_type_id = it5.id
WHERE kt.kind IN ('episode',
                   'movie')
  AND t.production_year <= 2015
  AND t.production_year >= 1925
  AND mi1.info IN ('CAM:Panavision Cameras and Lenses',
                    'LAB:DeLuxe',
                    'MET:',
                    'OFM:16 mm',
                    'PCS:Digital Intermediate',
                    'PCS:Super 35',
                    'PFM:16 mm',
                    'RAT:1.66 : 1',
                    'RAT:1.78 : 1 / (high definition)')
  AND it1.id IN ('108',
                  '7',
                  '97')
  AND it3.id = '100'
  AND it4.id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float <= 4.0
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND 0.0 <= mii2.info::float
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND 0.0 <= mii1.info::float
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float <= 10000.0
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('C642',
                           'D1324',
                           'D5415',
                           'E5621',
                           'G1641',
                           'G6235',
                           'G625',
                           'H2525',
                           'J2354',
                           'P4262',
                           'S5452',
                           'T3525',
                           'T5232')
       OR n.name_pcode_nf IS NULL)
  AND (ci.note IN ('(producer)',
                   '(production assistant)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'miscellaneous crew',
                   'producer')
  AND it5.id IN ('25');