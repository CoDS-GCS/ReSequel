WITH filtered_t AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 1975
     AND kt.kind IN ('episode')),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE (gender IN ('m')
          OR gender IS NULL)
     AND name_pcode_nf IN ('A5352',
                           'B6563',
                           'F6523',
                           'F6524',
                           'J5216',
                           'J525',
                           'J5262',
                           'W4362')),
     filtered_ci AS
  (SELECT movie_id,
          person_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE ci.note IS NULL
     AND rt.role IN ('actor'))
SELECT COUNT(*)
FROM filtered_t t
JOIN filtered_ci ci ON t.id = ci.movie_id
JOIN filtered_n n ON ci.person_id = n.id
JOIN movie_info mi1 ON t.id = mi1.movie_id
JOIN movie_info_idx mii1 ON t.id = mii1.movie_id
JOIN movie_info_idx mii2 ON t.id = mii2.movie_id
JOIN person_info pi1 ON n.id = pi1.person_id
JOIN aka_name an ON n.id = an.person_id
WHERE mi1.info_type_id IN ('16',
                  '7',
                  '8')
  AND mi1.info IN ('OFM:35 mm',
                    'PFM:35 mm',
                    'RAT:1.33 : 1',
                    'USA')
  AND mii1.info_type_id = '100'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float BETWEEN 0.0 AND 10000.0
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float BETWEEN 7.0 AND 11.0
  AND pi1.info_type_id IN ('22');