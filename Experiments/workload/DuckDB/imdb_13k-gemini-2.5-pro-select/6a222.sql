WITH core_cast AS
  (SELECT t.id AS movie_id,
          n.id AS person_id
   FROM title AS t
   JOIN cast_info AS ci ON t.id = ci.movie_id
   JOIN name AS n ON ci.person_id = n.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND t.kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie'))
     AND ci.note IS NULL
     AND ci.role_id IN
       (SELECT id
        FROM role_type
        WHERE ROLE IN ('actor'))
     AND (n.gender IN ('m')
          OR n.gender IS NULL)
     AND n.name_pcode_nf IN ('A6361',
                           'D1326',
                           'D1352',
                           'G6262',
                           'J5241',
                           'J5245',
                           'J5263',
                           'L2142',
                           'M6216',
                           'S3151'))
SELECT COUNT(*)
FROM core_cast cc
JOIN movie_info mi1 ON cc.movie_id = mi1.movie_id
JOIN movie_info_idx mii1 ON cc.movie_id = mii1.movie_id
JOIN movie_info_idx mii2 ON cc.movie_id = mii2.movie_id
JOIN person_info pi1 ON cc.person_id = pi1.person_id
JOIN aka_name an ON cc.person_id = an.person_id
WHERE mi1.info_type_id IN ('16',
                  '17',
                  '5')
  AND mi1.info IN ('Australia:M',
                    'UK:PG',
                    'USA:X',
                    'West Germany:12',
                    'West Germany:16')
  AND mii1.info_type_id = '100'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float BETWEEN 0.0 AND 1000.0
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float BETWEEN 3.0 AND 7.0
  AND pi1.info_type_id IN ('19');