WITH t_filtered AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 1975
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('movie'))),
     mi1_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('13',
                  '6')
     AND info IN ('Mono')),
     mii1_filtered AS
  (SELECT movie_id
   FROM movie_info_idx
   WHERE info_type_id = '100'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info::float BETWEEN 1000.0 AND 10000.0),
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
   WHERE (gender IN ('m')
          OR gender IS NULL)
     AND (name_pcode_nf IN ('A4163',
                           'A4253',
                           'A5352',
                           'A5362',
                           'C6425',
                           'F6521',
                           'F6525',
                           'R1632')
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
WHERE (ci.note IN ('(uncredited)')
       OR ci.note IS NULL)
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor'))
  AND pi1.info_type_id IN ('26');