
SELECT COUNT(*)
FROM title AS t,
     movie_info AS mi1,
     kind_type AS kt,
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
  AND t.kind_id = kt.id
  AND (kt.kind IN ('episode',
                   'movie'))
  AND (t.production_year BETWEEN 1975 AND 2015)
  AND (mi1.info IN ('OFM:35 mm',
                    'OFM:Video',
                    'PCS:Spherical',
                    'RAT:1.33 : 1',
                    'RAT:1.78 : 1',
                    'RAT:16:9 HD'))
  AND (mi1.info_type_id IN ('7'))
  AND mii1.info_type_id = '100'
  AND mii2.info_type_id = '101'
  AND (mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii2.info::float BETWEEN 3.0 AND 7.0)
  AND (mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii1.info::float BETWEEN 0.0 AND 1000.0)
  AND n.id = ci.person_id
  AND ci.person_id = pi1.person_id
  AND n.id = an.person_id
  AND rt.id = ci.role_id
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A4253',
                           'D5262',
                           'J23',
                           'J5235',
                           'J5241',
                           'J5362',
                           'J565',
                           'J6362',
                           'M5456',
                           'M6235',
                           'M6416',
                           'M6563',
                           'S2521',
                           'S2523'))
  AND (ci.note IN ('(head writer)',
                   '(production assistant)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actress',
                   'cinematographer',
                   'director',
                   'miscellaneous crew',
                   'writer'))
  AND (pi1.info_type_id IN ('34'));