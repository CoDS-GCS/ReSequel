WITH t_filtered AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 2015
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('tv movie',
                   'video movie'))),
     mi1_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('1',
                  '11',
                  '18')
     AND info IN ('90')),
     mii1_filtered AS
  (SELECT movie_id
   FROM movie_info_idx
   WHERE info_type_id = '100'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info::float BETWEEN 0.0 AND 1000.0),
     mii2_filtered AS
  (SELECT movie_id
   FROM movie_info_idx
   WHERE info_type_id = '101'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info::float BETWEEN 7.0 AND 11.0),
     n_filtered AS
  (SELECT id
   FROM name
   WHERE (gender IN ('f',
                    'm')
          OR gender IS NULL)
     AND (name_pcode_nf IN ('A4253',
                           'A5362',
                           'B6535',
                           'C6235',
                           'E4213',
                           'F6525',
                           'R1631',
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
  AND pi1.info_type_id IN ('26');