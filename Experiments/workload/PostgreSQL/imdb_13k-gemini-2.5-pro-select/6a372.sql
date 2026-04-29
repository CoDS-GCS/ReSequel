WITH filtered_t AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 1975
     AND kt.kind IN ('episode')),
     filtered_mi1 AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   WHERE mi1.info_type_id IN ('1',
                  '103',
                  '5')
     AND mi1.info IN ('60')),
     filtered_mii1 AS
  (SELECT mii1.movie_id
   FROM movie_info_idx AS mii1
   WHERE mii1.info_type_id = '100'
     AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii1.info::float >= 0.0
     AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii1.info::float <= 10000.0),
     filtered_mii2 AS
  (SELECT mii2.movie_id
   FROM movie_info_idx AS mii2
   WHERE mii2.info_type_id = '101'
     AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii2.info::float <= 8.0
     AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii2.info::float >= 0.0),
     filtered_persons AS
  (SELECT n.id
   FROM name AS n
   JOIN person_info AS pi1 ON n.id = pi1.person_id
   JOIN aka_name AS an ON n.id = an.person_id
   WHERE n.gender IN ('f',
                    'm')
     AND n.name_pcode_nf IN ('A5352',
                           'B6161',
                           'B6563',
                           'D1316',
                           'F6521',
                           'F6524',
                           'J3261',
                           'J5216',
                           'J525',
                           'J5262',
                           'P3616')
     AND pi1.info_type_id IN ('32'))
SELECT COUNT(*)
FROM cast_info AS ci
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN filtered_t t ON ci.movie_id = t.id
JOIN filtered_mi1 mi1 ON ci.movie_id = mi1.movie_id
JOIN filtered_mii1 mii1 ON ci.movie_id = mii1.movie_id
JOIN filtered_mii2 mii2 ON ci.movie_id = mii2.movie_id
JOIN filtered_persons p ON ci.person_id = p.id
WHERE ci.note IS NULL
  AND rt.role IN ('actor',
                   'actress');