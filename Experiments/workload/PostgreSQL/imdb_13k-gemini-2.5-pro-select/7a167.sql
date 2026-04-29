WITH filtered_t AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE kt.kind IN ('tv movie',
                   'video movie')
     AND t.production_year BETWEEN 1975 AND 2015),
     filtered_mi1 AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   WHERE mi1.info_type_id IN ('104',
                  '15',
                  '4')
     AND mi1.info IN ('English',
                    'French',
                    'German')),
     filtered_mii1 AS
  (SELECT mii1.movie_id
   FROM movie_info_idx AS mii1
   WHERE mii1.info_type_id = '100'
     AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii1.info::float BETWEEN 0.0 AND 10000.0),
     filtered_mii2 AS
  (SELECT mii2.movie_id
   FROM movie_info_idx AS mii2
   WHERE mii2.info_type_id = '101'
     AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii2.info::float BETWEEN 0.0 AND 8.0),
     filtered_n AS
  (SELECT n.id
   FROM name AS n
   WHERE (n.gender IN ('f')
          OR n.gender IS NULL)
     AND (n.name_pcode_nf IN ('C6235')
          OR n.name_pcode_nf IS NULL)),
     filtered_ci AS
  (SELECT ci.person_id,
          ci.movie_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE (ci.note IN ('(archive footage)')
          OR ci.note IS NULL)
     AND rt.role IN ('actress')),
     filtered_pi1 AS
  (SELECT pi1.person_id
   FROM person_info AS pi1
   WHERE pi1.info_type_id IN ('32'))
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