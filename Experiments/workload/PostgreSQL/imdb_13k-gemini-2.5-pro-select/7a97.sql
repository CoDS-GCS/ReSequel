
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
  AND (kt.kind IN ('episode',
                   'movie'))
  AND (t.production_year BETWEEN 1975 AND 2015)
  AND (mi1.info IN ('Black and White'))
  AND (it1.id IN ('13',
                  '2'))
  AND mii1.info_type_id = '100'
  AND mii2.info_type_id = '101'
  AND (mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii2.info::float BETWEEN 0.0 AND 8.0)
  AND (mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii1.info::float BETWEEN 5000.0 AND 500000.0)
  AND n.id = ci.person_id
  AND ci.person_id = pi1.person_id
  AND n.id = an.person_id
  AND rt.id = ci.role_id
  AND (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A4253',
                           'A5141',
                           'A5253',
                           'A5363',
                           'A5365',
                           'B1626',
                           'B6523',
                           'C6235',
                           'G1642',
                           'G6256',
                           'J5214',
                           'J526',
                           'L6524',
                           'S525',
                           'W4125'))
  AND (ci.note IN ('(executive producer)',
                   '(writer)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actor',
                   'actress',
                   'editor',
                   'producer',
                   'writer'))
  AND (pi1.info_type_id IN ('34'));