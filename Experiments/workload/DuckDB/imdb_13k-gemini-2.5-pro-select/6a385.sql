WITH t_filtered AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1975 AND 2015
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('tv movie',
                   'video movie'))),
     mi1_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('7')
     AND info IN ('PFM:Video',
                    'RAT:1.33 : 1',
                    'RAT:1.78 : 1')),
     mii1_filtered AS
  (SELECT movie_id
   FROM movie_info_idx
   WHERE info_type_id = '100'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info::float BETWEEN 0.0 AND 10000.0),
     mii2_filtered AS
  (SELECT movie_id
   FROM movie_info_idx
   WHERE info_type_id = '101'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info::float BETWEEN 0.0 AND 4.0),
     n_filtered AS
  (SELECT id
   FROM name
   WHERE (gender IN ('f',
                    'm')
          OR gender IS NULL)
     AND (name_pcode_nf IN ('A4253',
                           'A5362',
                           'B6535',
                           'C6231',
                           'C6235',
                           'E4213',
                           'K6235',
                           'R1632',
                           'S3152')
          OR name_pcode_nf IS NULL))
SELECT COUNT(*)
FROM t_filtered t
JOIN mi1_filtered mi1 ON t.id = mi1.movie_id
JOIN mii1_filtered mii1 ON t.id = mii1.movie_id
JOIN mii2_filtered mii2 ON t.id = mii2.movie_id
JOIN cast_info ci ON t.id = ci.movie_id
JOIN n_filtered n ON ci.person_id = n.id
JOIN aka_name an ON n.id = an.person_id
JOIN person_info pi1 ON n.id = pi1.person_id
WHERE (ci.note IN ('(archive footage)')
       OR ci.note IS NULL)
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'actress'))
  AND pi1.info_type_id IN ('34');