WITH qualified_cast AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   INNER JOIN name AS n ON ci.person_id = n.id
   INNER JOIN aka_name AS an ON n.id = an.person_id
   INNER JOIN person_info AS pi1 ON n.id = pi1.person_id
   INNER JOIN info_type AS it5 ON pi1.info_type_id = it5.id
   INNER JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE ci.note IS NULL
     AND rt.role IN ('actor')
     AND (n.gender IN ('m')
          OR n.gender IS NULL)
     AND n.name_pcode_nf IN ('A5352',
                           'A5362',
                           'F6521',
                           'F6523',
                           'J525',
                           'J5252',
                           'J5262',
                           'M2426',
                           'R1631',
                           'R1632',
                           'R2636',
                           'S3152')
     AND it5.id IN ('31'))
SELECT COUNT(*)
FROM title AS t
INNER JOIN qualified_cast AS qc ON t.id = qc.movie_id
INNER JOIN kind_type AS kt ON t.kind_id = kt.id
INNER JOIN movie_info AS mi1 ON t.id = mi1.movie_id
INNER JOIN info_type AS it1 ON mi1.info_type_id = it1.id
INNER JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
INNER JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
WHERE t.production_year BETWEEN 1950 AND 1990
  AND kt.kind IN ('episode',
                   'movie')
  AND mi1.info IN ('New York City, New York, USA',
                    'Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA')
  AND it1.id IN ('15',
                  '18')
  AND mii1.info_type_id = '100'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float BETWEEN 0.0 AND 1000.0
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float BETWEEN 3.0 AND 7.0;