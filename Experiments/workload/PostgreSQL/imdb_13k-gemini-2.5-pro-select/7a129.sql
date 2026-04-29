WITH filtered_t AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE kt.kind IN ('tv movie',
                   'video movie')
     AND t.production_year BETWEEN 1925 AND 2015),
     filtered_mi1 AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   WHERE mi1.info_type_id IN ('2',
                  '5')
     AND mi1.info IN ('Black and White')),
     filtered_mii1 AS
  (SELECT mii1.movie_id
   FROM movie_info_idx AS mii1
   WHERE mii1.info_type_id = '100'
     AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii1.info::float BETWEEN 0.0 AND 1000.0),
     filtered_mii2 AS
  (SELECT mii2.movie_id
   FROM movie_info_idx AS mii2
   WHERE mii2.info_type_id = '101'
     AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii2.info::float BETWEEN 3.0 AND 7.0),
     filtered_n AS
  (SELECT n.id
   FROM name AS n
   WHERE (n.gender IN ('f',
                    'm')
          OR n.gender IS NULL)
     AND (n.name_pcode_nf IN ('A4253',
                           'A5362',
                           'B6535',
                           'C6231',
                           'C6235',
                           'F6521',
                           'F6525',
                           'R1631',
                           'R1632',
                           'S3152')
          OR n.name_pcode_nf IS NULL)),
     filtered_ci AS
  (SELECT ci.person_id,
          ci.movie_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE (ci.note IN ('(archive footage)')
          OR ci.note IS NULL)
     AND rt.role IN ('actor',
                   'actress')),
     filtered_pi1 AS
  (SELECT pi1.person_id
   FROM person_info AS pi1
   WHERE pi1.info_type_id IN ('31'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN filtered_mi1 ON t.id = filtered_mi1.movie_id
JOIN filtered_mii1 ON t.id = filtered_mii1.movie_id
JOIN filtered_mii2 ON t.id = filtered_mii2.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN filtered_ci AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_pi1 AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id;