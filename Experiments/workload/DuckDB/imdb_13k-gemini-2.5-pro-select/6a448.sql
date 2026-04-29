
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
  AND mi1.info IN ('Color')
  AND mi1.info_type_id IN ('12',
                  '17',
                  '2')
  AND mii1.info_type_id = '100'
  AND mii2.info_type_id = '101'
  AND (mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii2.info::float <= 4.0)
  AND (mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii2.info::float >= 0.0)
  AND (mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii1.info::float >= 1000.0)
  AND (mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii1.info::float <= 10000.0)
  AND n.id = ci.person_id
  AND n.id = pi1.person_id
  AND n.id = an.person_id
  AND rt.id = ci.role_id
  AND n.gender IN ('m')
  AND n.name_pcode_nf IN ('B6516',
                           'C6231',
                           'C6424',
                           'D1312',
                           'D5432',
                           'F6525',
                           'J5263',
                           'J5452',
                           'M2416',
                           'M6351',
                           'P3635',
                           'R1634',
                           'R3621',
                           'S3151')
  AND (ci.note IN ('(uncredited)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor')
  AND pi1.info_type_id IN ('34');