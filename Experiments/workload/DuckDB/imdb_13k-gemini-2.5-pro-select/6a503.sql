WITH person_base AS
  (SELECT n.id
   FROM name AS n
   JOIN person_info AS pi1 ON n.id = pi1.person_id
   WHERE (n.gender IN ('m')
          OR n.gender IS NULL)
     AND (n.name_pcode_nf IN ('B6514',
                           'D1352',
                           'E3631',
                           'G6262',
                           'J5236',
                           'J5261',
                           'J5263',
                           'L2142',
                           'M4245',
                           'M6352',
                           'S3521',
                           'W4361',
                           'W4525')
          OR n.name_pcode_nf IS NULL)
     AND pi1.info_type_id IN ('34')),
     cast_base AS
  (SELECT ci.movie_id,
          ci.person_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE ci.note IS NULL
     AND rt.role IN ('actor',
                   'director',
                   'production designer'))
SELECT COUNT(*)
FROM cast_base cb
JOIN person_base pb ON cb.person_id = pb.id
JOIN aka_name AS an ON pb.id = an.person_id
JOIN title AS t ON cb.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
WHERE t.production_year BETWEEN 1950 AND 1990
  AND kt.kind IN ('episode',
                   'movie')
  AND mi1.info_type_id IN ('8')
  AND mi1.info IN ('Canada',
                    'France',
                    'Italy',
                    'Japan',
                    'UK',
                    'USA',
                    'West Germany')
  AND mii1.info_type_id = '100'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float BETWEEN 0.0 AND 1000.0
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float BETWEEN 3.0 AND 7.0;