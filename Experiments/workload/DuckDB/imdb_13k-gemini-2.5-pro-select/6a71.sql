WITH core_cast AS
  (SELECT t.id AS movie_id,
          n.id AS person_id
   FROM title AS t
   JOIN cast_info AS ci ON t.id = ci.movie_id
   JOIN name AS n ON ci.person_id = n.id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND t.kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode'))
     AND ci.note IS NULL
     AND ci.role_id IN
       (SELECT id
        FROM role_type
        WHERE ROLE IN ('actor'))
     AND (n.gender IN ('m')
          OR n.gender IS NULL)
     AND n.name_pcode_nf IN ('A4163',
                           'A5352',
                           'B6563',
                           'D1316',
                           'F6521',
                           'F6523',
                           'J5216',
                           'J525',
                           'J5262',
                           'P3616',
                           'R1635',
                           'W4362'))
SELECT COUNT(*)
FROM core_cast cc
JOIN movie_info mi1 ON cc.movie_id = mi1.movie_id
JOIN movie_info_idx mii1 ON cc.movie_id = mii1.movie_id
JOIN movie_info_idx mii2 ON cc.movie_id = mii2.movie_id
JOIN person_info pi1 ON cc.person_id = pi1.person_id
JOIN aka_name an ON cc.person_id = an.person_id
WHERE mi1.info_type_id IN ('1',
                  '13',
                  '7')
  AND mi1.info IN ('60',
                    'OFM:Live',
                    'OFM:Video',
                    'PFM:Video')
  AND mii1.info_type_id = '100'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float BETWEEN 0.0 AND 1000.0
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float BETWEEN 2.0 AND 5.0
  AND pi1.info_type_id IN ('26');