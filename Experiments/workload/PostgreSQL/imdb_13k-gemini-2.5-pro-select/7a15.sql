WITH person_cast_subset AS
  (SELECT ci.movie_id
   FROM name AS n
   JOIN aka_name AS an ON n.id = an.person_id
   JOIN person_info AS pi1 ON n.id = pi1.person_id
   JOIN cast_info AS ci ON n.id = ci.person_id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IN ('f')
     AND (n.name_pcode_nf IN ('C6235')
          OR n.name_pcode_nf IS NULL)
     AND pi1.info_type_id IN ('19')
     AND (ci.note IN ('(archive footage)')
          OR ci.note IS NULL)
     AND rt.role IN ('actress'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN person_cast_subset AS pcs ON t.id = pcs.movie_id
WHERE kt.kind IN ('tv movie',
                   'video movie')
  AND t.production_year BETWEEN 1975 AND 2015
  AND mi1.info_type_id IN ('102',
                  '108',
                  '7')
  AND mi1.info IN ('OFM:35 mm',
                    'OFM:Video',
                    'PFM:35 mm')
  AND mii1.info_type_id = '100'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float BETWEEN 0.0 AND 1000.0
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float BETWEEN 0.0 AND 8.0;