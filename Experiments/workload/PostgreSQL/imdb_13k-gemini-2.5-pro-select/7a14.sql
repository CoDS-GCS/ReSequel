WITH filtered_movies AS
  (SELECT t.id AS movie_id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
   JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
   JOIN movie_keyword AS mk ON t.id = mk.movie_id
   WHERE kt.kind IN ('movie')
     AND t.production_year BETWEEN 1875 AND 1975
     AND it1.id IN ('7',
                  '98')
     AND mi1.info IN ('MET:',
                    'MET:150 m',
                    'MET:300 m',
                    'MET:600 m',
                    'RAT:2.35 : 1')
     AND mii1.info_type_id = '100'
     AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii1.info::float >= 0.0
     AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii1.info::float <= 10000.0
     AND mii2.info_type_id = '101'
     AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii2.info::float <= 5.0
     AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii2.info::float >= 2.0),
     filtered_persons AS
  (SELECT n.id AS person_id
   FROM name AS n
   JOIN person_info AS pi1 ON n.id = pi1.person_id
   JOIN aka_name AS an ON n.id = an.person_id
   WHERE (n.gender IN ('f')
          OR n.gender IS NULL)
     AND (n.name_pcode_nf IN ('M6263')
          OR n.name_pcode_nf IS NULL)
     AND pi1.info_type_id IN ('34')),
     filtered_ci AS
  (SELECT ci.movie_id,
          ci.person_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE ci.note IS NULL
     AND rt.role IN ('actress'))
SELECT COUNT(*)
FROM filtered_ci
JOIN filtered_movies ON filtered_ci.movie_id = filtered_movies.movie_id
JOIN filtered_persons ON filtered_ci.person_id = filtered_persons.person_id;