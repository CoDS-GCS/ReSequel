
SELECT COUNT(*)
FROM title AS t,
     movie_info AS mi1,
     kind_type AS kt,
     info_type AS it1,
     info_type AS it3,
     info_type AS it4,
     movie_info_idx AS mii1,
     movie_info_idx AS mii2,
     movie_keyword AS mk,
     aka_name AS an,
     name AS n,
     info_type AS it5,
     person_info AS pi1,
     cast_info AS ci,
     role_type AS rt
WHERE t.id = mi1.movie_id
  AND t.id = ci.movie_id
  AND t.id = mii1.movie_id
  AND t.id = mii2.movie_id
  AND t.id = mk.movie_id
  AND mi1.info_type_id = it1.id
  AND mii1.info_type_id = it3.id
  AND mii2.info_type_id = it4.id
  AND t.kind_id = kt.id
  AND n.id = ci.person_id
  AND ci.person_id = pi1.person_id
  AND it5.id = pi1.info_type_id
  AND n.id = an.person_id
  AND rt.id = ci.role_id
  AND (kt.kind IN ('episode',
                   'movie'))
  AND (t.production_year BETWEEN 1950 AND 1990)
  AND (mi1.info IN ('30',
                    '60'))
  AND (it1.id IN ('1',
                  '17',
                  '98'))
  AND it3.id = '100'
  AND it4.id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float BETWEEN 7.0 AND 11.0
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float BETWEEN 0.0 AND 10000.0
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A5351',
                           'C6235',
                           'C6421',
                           'C6425',
                           'F6362',
                           'F6521',
                           'J5216',
                           'J525',
                           'P3623',
                           'R1632',
                           'R1636',
                           'V4356',
                           'V5253')
       OR n.name_pcode_nf IS NULL)
  AND (ci.note IN ('(producer)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actor',
                   'composer',
                   'producer'))
  AND (it5.id IN ('31'));