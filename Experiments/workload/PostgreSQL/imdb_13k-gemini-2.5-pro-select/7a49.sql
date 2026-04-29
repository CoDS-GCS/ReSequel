
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE kt.kind IN ('tv movie',
                   'video movie')
     AND t.production_year BETWEEN 1975 AND 2015) AS t_filtered
JOIN cast_info AS ci ON t_filtered.id = ci.movie_id
JOIN
  (SELECT n.id
   FROM name AS n
   WHERE n.gender IN ('f')
     AND (n.name_pcode_nf IN ('C6235')
          OR n.name_pcode_nf IS NULL)) AS n_filtered ON ci.person_id = n_filtered.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON ci.movie_id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info_idx AS mii1 ON ci.movie_id = mii1.movie_id
JOIN movie_info_idx AS mii2 ON ci.movie_id = mii2.movie_id
JOIN movie_keyword AS mk ON ci.movie_id = mk.movie_id
JOIN person_info AS pi1 ON ci.person_id = pi1.person_id
JOIN info_type AS it5 ON pi1.info_type_id = it5.id
JOIN aka_name AS an ON ci.person_id = an.person_id
WHERE rt.role IN ('actress')
  AND (ci.note IN ('(archive footage)')
       OR ci.note IS NULL)
  AND it1.id IN ('1',
                  '8',
                  '9')
  AND mi1.info IN ('Canada',
                    'Germany',
                    'UK',
                    'USA')
  AND mii1.info_type_id = '100'
  AND mii1.info::float BETWEEN 0.0 AND 1000.0
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info_type_id = '101'
  AND mii2.info::float BETWEEN 7.0 AND 11.0
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND it5.id IN ('34');