WITH mii1_filtered AS
  (SELECT movie_id
   FROM movie_info_idx
   WHERE info_type_id = '100'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info::float >= 1000.0
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info::float <= 10000.0),
     mii2_filtered AS
  (SELECT movie_id
   FROM movie_info_idx
   WHERE info_type_id = '101'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info::float <= 8.0
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info::float >= 0.0)
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN mii1_filtered AS mii1 ON t.id = mii1.movie_id
JOIN mii2_filtered AS mii2 ON t.id = mii2.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE kt.kind IN ('tv movie',
                   'video movie')
  AND t.production_year BETWEEN 1975 AND 2015
  AND it1.id IN ('18',
                  '5',
                  '98')
  AND mi1.info IN ('Los Angeles, California, USA')
  AND (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A4253',
                           'A5242',
                           'A5352',
                           'D1316',
                           'F6521',
                           'F6525',
                           'J5236',
                           'R1631',
                           'S3151')
       OR n.name_pcode_nf IS NULL)
  AND pi1.info_type_id IN ('31')
  AND ci.note IS NULL
  AND rt.role IN ('actor',
                   'actress',
                   'director');