
SELECT COUNT(*)
FROM title AS t
INNER JOIN kind_type AS kt ON t.kind_id = kt.id
INNER JOIN movie_info AS mi1 ON t.id = mi1.movie_id
INNER JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
INNER JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
INNER JOIN cast_info AS ci ON t.id = ci.movie_id
INNER JOIN role_type AS rt ON ci.role_id = rt.id
INNER JOIN name AS n ON ci.person_id = n.id
INNER JOIN aka_name AS an ON n.id = an.person_id
INNER JOIN person_info AS pi1 ON n.id = pi1.person_id
WHERE kt.kind IN ('episode')
  AND t.production_year BETWEEN 1875 AND 1975
  AND mi1.info IN ('Black and White')
  AND mi1.info_type_id IN ('16',
                  '2',
                  '98')
  AND mii1.info_type_id = '100'
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float BETWEEN 3.0 AND 7.0
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float BETWEEN 0.0 AND 10000.0
  AND (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('C6231',
                           'E4213',
                           'F6525',
                           'J513',
                           'M6251',
                           'M6263',
                           'P3625',
                           'R1631',
                           'R2631')
       OR n.name_pcode_nf IS NULL)
  AND ci.note IS NULL
  AND rt.role IN ('actor',
                   'actress')
  AND pi1.info_type_id IN ('19');