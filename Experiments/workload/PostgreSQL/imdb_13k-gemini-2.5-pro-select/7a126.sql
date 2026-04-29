
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
  AND (t.production_year BETWEEN 1925 AND 2015)
  AND (mi1.info IN ('Adult',
                    'Adventure',
                    'Biography',
                    'Music',
                    'Musical',
                    'Mystery',
                    'Sci-Fi',
                    'War',
                    'Western'))
  AND (mi1.info_type_id IN ('11',
                  '3',
                  '94'))
  AND mii1.info_type_id = '100'
  AND mii2.info_type_id = '101'
  AND (mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii2.info::float BETWEEN 0.0 AND 8.0)
  AND (mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii1.info::float BETWEEN 0.0 AND 1000.0)
  AND n.id = ci.person_id
  AND ci.person_id = pi1.person_id
  AND n.id = an.person_id
  AND rt.id = ci.role_id
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A4253',
                           'A5364',
                           'B6514',
                           'D5236',
                           'F6521',
                           'H6252',
                           'J2524',
                           'J2532',
                           'J562',
                           'P3653',
                           'R2636',
                           'S524'))
  AND (ci.note IN ('(producer)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actor',
                   'director',
                   'producer'))
  AND (pi1.info_type_id IN ('22'));