
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN title AS t ON ci.movie_id = t.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
WHERE n.gender IN ('m')
  AND (n.name_pcode_nf IN ('A4163',
                           'A5352',
                           'C6421',
                           'C6423',
                           'C6424',
                           'C6425',
                           'F6521',
                           'F6525',
                           'R1631',
                           'R1632')
       OR n.name_pcode_nf IS NULL)
  AND pi1.info_type_id IN ('22')
  AND (ci.note IN ('(uncredited)')
       OR ci.note IS NULL)
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor'))
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('movie'))
  AND t.production_year BETWEEN 1875 AND 1975
  AND mi1.info_type_id IN ('15',
                  '2')
  AND mi1.info IN ('Black and White')
  AND mii1.info_type_id = '100'
  AND (mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii1.info::float BETWEEN 5000.0 AND 500000.0)
  AND mii2.info_type_id = '101'
  AND (mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii2.info::float BETWEEN 0.0 AND 8.0);