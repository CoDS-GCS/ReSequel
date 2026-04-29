WITH person_base AS
  (SELECT n.id
   FROM name AS n
   JOIN person_info AS pi1 ON n.id = pi1.person_id
   WHERE (n.gender IN ('f',
                    'm')
          OR n.gender IS NULL)
     AND (n.name_pcode_nf IN ('A5236',
                           'A5316',
                           'B652',
                           'D5362',
                           'G6253',
                           'I2141',
                           'J2532',
                           'L216',
                           'M6232',
                           'N2423',
                           'N2426',
                           'R1636',
                           'R526',
                           'S5262')
          OR n.name_pcode_nf IS NULL)
     AND pi1.info_type_id IN ('31')),
     cast_base AS
  (SELECT ci.movie_id,
          ci.person_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE ci.note IS NULL
     AND rt.role IN ('actor',
                   'actress',
                   'editor'))
SELECT COUNT(*)
FROM cast_base cb
JOIN person_base pb ON cb.person_id = pb.id
JOIN aka_name AS an ON pb.id = an.person_id
JOIN title AS t ON cb.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND kt.kind IN ('episode',
                   'movie')
  AND mi1.info_type_id IN ('11',
                  '2')
  AND mi1.info IN ('Black and White')
  AND mii1.info_type_id = '100'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float BETWEEN 0.0 AND 1000.0
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float BETWEEN 7.0 AND 11.0;