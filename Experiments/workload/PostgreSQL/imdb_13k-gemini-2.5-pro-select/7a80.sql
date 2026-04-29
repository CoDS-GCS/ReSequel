WITH movie_subset AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
   JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
   JOIN movie_keyword AS mk ON t.id = mk.movie_id
   WHERE kt.kind IN ('tv movie',
                   'video movie')
     AND t.production_year BETWEEN 1925 AND 2015
     AND mi1.info_type_id IN ('16',
                  '18')
     AND mi1.info IN ('USA:2005')
     AND mii1.info_type_id = '100'
     AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii1.info::float BETWEEN 0.0 AND 1000.0
     AND mii2.info_type_id = '101'
     AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii2.info::float BETWEEN 0.0 AND 8.0),
     person_subset AS
  (SELECT n.id
   FROM name AS n
   JOIN aka_name AS an ON n.id = an.person_id
   JOIN person_info AS pi1 ON n.id = pi1.person_id
   WHERE n.gender IN ('f',
                    'm')
     AND (n.name_pcode_nf IN ('A5362',
                           'B6535',
                           'C6231',
                           'C6235',
                           'E4213',
                           'F6521',
                           'F6525',
                           'K6235',
                           'R2632',
                           'S3152')
          OR n.name_pcode_nf IS NULL)
     AND pi1.info_type_id IN ('34'))
SELECT COUNT(*)
FROM movie_subset ms
JOIN cast_info ci ON ms.id = ci.movie_id
JOIN person_subset ps ON ci.person_id = ps.id
JOIN role_type rt ON ci.role_id = rt.id
WHERE (ci.note IN ('(archive footage)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'actress');