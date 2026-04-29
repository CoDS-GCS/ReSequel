
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
WHERE t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('movie'))
  AND t.production_year BETWEEN 1925 AND 1975
  AND mi1.info_type_id IN ('1',
                  '4',
                  '8')
  AND mi1.info IN ('English',
                    'France',
                    'French',
                    'German',
                    'India',
                    'Italian',
                    'Italy',
                    'Japan',
                    'Japanese',
                    'UK')
  AND mii1.info_type_id = '100'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float BETWEEN 1000.0 AND 10000.0
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float BETWEEN 0.0 AND 8.0
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor'))
  AND (ci.note IN ('(uncredited)')
       OR ci.note IS NULL)
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND n.name_pcode_nf IN ('C6423',
                           'C6426',
                           'F6524',
                           'F6532',
                           'R1631',
                           'V4356',
                           'W4362')
  AND pi1.info_type_id IN ('25');