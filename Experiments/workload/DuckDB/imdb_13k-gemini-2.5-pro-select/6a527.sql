
SELECT COUNT(*)
FROM title AS t,
     movie_info AS mi1,
     kind_type AS kt,
     movie_info_idx AS mii1,
     movie_info_idx AS mii2,
     aka_name AS an,
     name AS n,
     person_info AS pi1,
     cast_info AS ci,
     role_type AS rt
WHERE t.id = mi1.movie_id
  AND t.id = ci.movie_id
  AND t.id = mii1.movie_id
  AND t.id = mii2.movie_id
  AND t.kind_id = kt.id
  AND kt.kind IN ('episode',
                   'movie')
  AND t.production_year BETWEEN 1925 AND 2015
  AND mi1.info IN ('10',
                    '11',
                    '12',
                    '4',
                    '6',
                    '60',
                    '8',
                    '90',
                    'Dolby SR',
                    'Stereo')
  AND mi1.info_type_id IN ('1',
                  '6',
                  '94')
  AND mii1.info_type_id = '100'
  AND mii2.info_type_id = '101'
  AND (mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii2.info::float <= 8.0)
  AND (mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii2.info::float >= 0.0)
  AND (mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii1.info::float >= 5000.0)
  AND (mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii1.info::float <= 500000.0)
  AND n.id = ci.person_id
  AND n.id = pi1.person_id
  AND n.id = an.person_id
  AND rt.id = ci.role_id
  AND n.gender IN ('m')
  AND n.name_pcode_nf IN ('B6525',
                           'G6325',
                           'J2123',
                           'K1526',
                           'K5235',
                           'L216',
                           'M6126',
                           'P362',
                           'S2153',
                           'S4136')
  AND (ci.note IN ('(executive producer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'producer')
  AND pi1.info_type_id IN ('22');