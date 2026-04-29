
SELECT COUNT(*)
FROM title AS t,
     movie_info AS mi1,
     kind_type AS kt,
     info_type AS it1,
     movie_info_idx AS mii1,
     movie_info_idx AS mii2,
     movie_keyword AS mk,
     aka_name AS an,
     name AS n,
     person_info AS pi1,
     cast_info AS ci,
     role_type AS rt
WHERE t.id = mi1.movie_id
  AND t.id = ci.movie_id
  AND t.id = mii1.movie_id
  AND t.id = mii2.movie_id
  AND t.id = mk.movie_id
  AND mi1.info_type_id = it1.id
  AND t.kind_id = kt.id
  AND (kt.kind IN ('movie'))
  AND (t.production_year BETWEEN 1875 AND 1975)
  AND (mi1.info IN ('Filipino',
                    'Hindi',
                    'Japanese',
                    'Portuguese',
                    'Spanish',
                    'Turkish'))
  AND (it1.id IN ('4',
                  '6',
                  '94'))
  AND mii1.info_type_id = '100'
  AND mii2.info_type_id = '101'
  AND (mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii2.info::float BETWEEN 7.0 AND 11.0)
  AND (mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii1.info::float BETWEEN 1000.0 AND 10000.0)
  AND n.id = ci.person_id
  AND ci.person_id = pi1.person_id
  AND n.id = an.person_id
  AND rt.id = ci.role_id
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A4163',
                           'A6362',
                           'B6563',
                           'E3632',
                           'F6362',
                           'F6524',
                           'F6526',
                           'F6532',
                           'H6163',
                           'R1635',
                           'R1636',
                           'R2632',
                           'S2534',
                           'V4356',
                           'W4362'))
  AND (ci.note IN ('(producer)',
                   '(uncredited)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actor',
                   'director',
                   'producer'))
  AND (pi1.info_type_id IN ('32'));