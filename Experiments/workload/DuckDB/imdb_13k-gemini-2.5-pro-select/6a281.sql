
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
  AND n.id = ci.person_id
  AND n.id = pi1.person_id
  AND n.id = an.person_id
  AND rt.id = ci.role_id
  AND kt.kind IN ('episode',
                   'movie')
  AND t.production_year <= 2015
  AND t.production_year >= 1925
  AND mi1.info IN ('Action',
                    'Adventure',
                    'Animation',
                    'Comedy',
                    'Crime',
                    'Documentary',
                    'Dolby Digital',
                    'Mono',
                    'Short',
                    'Stereo',
                    'Thriller')
  AND mi1.info_type_id IN ('3',
                  '6',
                  '97')
  AND mii1.info_type_id = '100'
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float <= 5.0
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND 2.0 <= mii2.info::float
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND 5000.0 <= mii1.info::float
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float <= 500000.0
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND n.name_pcode_nf IN ('D135',
                           'D5463',
                           'F6525',
                           'H252',
                           'J5136',
                           'J5152',
                           'L6252',
                           'M2123',
                           'M2426',
                           'N242',
                           'S6256')
  AND (ci.note IN ('(executive producer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'composer',
                   'director',
                   'producer')
  AND pi1.info_type_id IN ('26');