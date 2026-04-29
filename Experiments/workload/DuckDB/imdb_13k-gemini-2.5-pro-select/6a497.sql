
SELECT COUNT(*)
FROM
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1975 AND 2015
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('video movie'))) AS t
JOIN
  (SELECT movie_id,
          person_id
   FROM cast_info
   WHERE note IS NULL
     AND role_id IN
       (SELECT id
        FROM role_type
        WHERE ROLE IN ('actress'))) AS ci ON t.id = ci.movie_id
JOIN
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IS NULL) AS n ON ci.person_id = n.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
WHERE mi1.info_type_id IN ('15',
                  '6',
                  '9')
  AND mi1.info IN ('Stereo')
  AND mii1.info_type_id = '100'
  AND mii1.info::float BETWEEN 0.0 AND 10000.0
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info_type_id = '101'
  AND mii2.info::float BETWEEN 2.0 AND 5.0
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND pi1.info_type_id IN ('37');