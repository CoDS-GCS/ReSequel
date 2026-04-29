
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
WHERE kt.kind IN ('tv movie',
                   'video movie')
  AND t.production_year <= 2015
  AND t.production_year >= 1975
  AND mi1.info IN ('France',
                    'Germany',
                    'UK',
                    'USA')
  AND mi1.info_type_id IN ('12',
                  '8',
                  '98')
  AND mii1.info_type_id = '100'
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float <= 5.0
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND 2.0 <= mii2.info::float
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND 0.0 <= mii1.info::float
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float <= 10000.0
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A4163',
                           'F6521',
                           'J5252',
                           'M2425')
       OR n.name_pcode_nf IS NULL)
  AND ci.note IS NULL
  AND rt.role IN ('actor',
                   'director')
  AND pi1.info_type_id IN ('31');