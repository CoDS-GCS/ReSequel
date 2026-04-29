WITH filtered_cast AS
  (SELECT ci.movie_id,
          ci.person_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE ci.note IS NULL
     AND rt.role IN ('actress'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
JOIN filtered_cast AS fc ON t.id = fc.movie_id
JOIN name AS n ON fc.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
WHERE kt.kind IN ('movie')
  AND t.production_year BETWEEN 1925 AND 1975
  AND mi1.info_type_id IN ('103',
                  '17',
                  '6')
  AND mi1.info IN ('Silent')
  AND mii1.info_type_id = '100'
  AND mii2.info_type_id = '101'
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND n.name_pcode_nf IS NULL
  AND pi1.info_type_id IN ('25')
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float BETWEEN 0.0 AND 1000.0
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float BETWEEN 2.0 AND 5.0;