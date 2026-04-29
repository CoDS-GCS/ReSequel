WITH t_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE kt.kind IN ('movie')
     AND t.production_year BETWEEN 1925 AND 1975),
     mi1_filtered AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   WHERE mi1.info_type_id IN ('8')
     AND mi1.info IN ('France',
                    'India',
                    'Italy',
                    'Japan',
                    'Spain',
                    'USA')),
     mii1_filtered AS
  (SELECT mii1.movie_id
   FROM movie_info_idx AS mii1
   WHERE mii1.info_type_id = '100'
     AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii1.info::float BETWEEN 0.0 AND 10000.0),
     mii2_filtered AS
  (SELECT mii2.movie_id
   FROM movie_info_idx AS mii2
   WHERE mii2.info_type_id = '101'
     AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii2.info::float BETWEEN 0.0 AND 4.0),
     n_filtered AS
  (SELECT n.id
   FROM name AS n
   WHERE (n.gender IN ('f')
          OR n.gender IS NULL)
     AND n.name_pcode_nf IS NULL),
     pi1_filtered AS
  (SELECT pi1.person_id
   FROM person_info AS pi1
   WHERE pi1.info_type_id IN ('31')),
     ci_filtered AS
  (SELECT ci.movie_id,
          ci.person_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE ci.note IS NULL
     AND rt.role IN ('actress'))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN mi1_filtered AS mi1 ON t.id = mi1.movie_id
JOIN mii1_filtered AS mii1 ON t.id = mii1.movie_id
JOIN mii2_filtered AS mii2 ON t.id = mii2.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN ci_filtered AS ci ON t.id = ci.movie_id
JOIN n_filtered AS n ON ci.person_id = n.id
JOIN pi1_filtered AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id;