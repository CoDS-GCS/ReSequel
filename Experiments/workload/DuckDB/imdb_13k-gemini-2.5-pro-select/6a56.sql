WITH qualified_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
   JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
   WHERE kt.kind IN ('tv movie',
                   'video movie')
     AND t.production_year BETWEEN 1975 AND 2015
     AND mi1.info IN ('60')
     AND mi1.info_type_id IN ('1',
                  '102',
                  '18')
     AND mii1.info_type_id = '100'
     AND mii2.info_type_id = '101'
     AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii2.info::float BETWEEN 7.0 AND 11.0
     AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii1.info::float BETWEEN 0.0 AND 10000.0)
SELECT COUNT(*)
FROM qualified_movies AS qm
JOIN cast_info AS ci ON qm.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
WHERE (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A4253',
                           'A5242',
                           'D1316',
                           'F6521',
                           'F6525',
                           'J5236',
                           'J5252',
                           'M2425',
                           'P3625',
                           'R1631',
                           'S3151')
       OR n.name_pcode_nf IS NULL)
  AND ci.note IS NULL
  AND rt.role IN ('actor',
                   'actress',
                   'director')
  AND pi1.info_type_id IN ('32');