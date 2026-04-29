WITH core_cast AS
  (SELECT t.id AS movie_id,
          n.id AS person_id
   FROM title AS t
   JOIN cast_info AS ci ON t.id = ci.movie_id
   JOIN name AS n ON ci.person_id = n.id
   WHERE t.production_year BETWEEN 1925 AND 1975
     AND t.kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('movie'))
     AND ci.note IS NULL
     AND ci.role_id IN
       (SELECT id
        FROM role_type
        WHERE ROLE IN ('actress'))
     AND (n.gender IN ('f')
          OR n.gender IS NULL)
     AND n.name_pcode_nf IN ('M6263'))
SELECT COUNT(*)
FROM core_cast cc
JOIN movie_info mi1 ON cc.movie_id = mi1.movie_id
JOIN movie_info_idx mii1 ON cc.movie_id = mii1.movie_id
JOIN movie_info_idx mii2 ON cc.movie_id = mii2.movie_id
JOIN person_info pi1 ON cc.person_id = pi1.person_id
JOIN aka_name an ON cc.person_id = an.person_id
WHERE mi1.info_type_id IN ('17',
                  '18',
                  '8')
  AND mi1.info IN ('France',
                    'India',
                    'Italy',
                    'Japan',
                    'Mexico',
                    'UK',
                    'USA')
  AND mii1.info_type_id = '100'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float BETWEEN 0.0 AND 1000.0
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float BETWEEN 7.0 AND 11.0
  AND pi1.info_type_id IN ('37');