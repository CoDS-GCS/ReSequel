
SELECT COUNT(*)
FROM title AS t,
     movie_info AS mi1,
     kind_type AS kt,
     info_type AS it1,
     movie_info_idx AS mii1,
     movie_info_idx AS mii2,
     aka_name AS an,
     name AS n,
     person_info AS pi1,
     info_type AS it5,
     cast_info AS ci,
     role_type AS rt
WHERE t.id = mi1.movie_id
  AND t.id = ci.movie_id
  AND t.id = mii1.movie_id
  AND t.id = mii2.movie_id
  AND mi1.info_type_id = it1.id
  AND t.kind_id = kt.id
  AND n.id = ci.person_id
  AND n.id = pi1.person_id
  AND n.id = an.person_id
  AND ci.role_id = rt.id
  AND pi1.info_type_id = it5.id
  AND kt.kind IN ('movie')
  AND t.production_year BETWEEN 1925 AND 1975
  AND mi1.info IN ('English',
                    'French',
                    'German',
                    'Japanese',
                    'Spanish')
  AND it1.id IN ('4')
  AND mii1.info_type_id = '100'
  AND mii2.info_type_id = '101'
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND n.name_pcode_nf IS NULL
  AND ci.note IS NULL
  AND rt.role IN ('actress')
  AND it5.id IN ('37')
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float BETWEEN 5000.0 AND 500000.0
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float BETWEEN 2.0 AND 5.0;