WITH t_filtered AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 1975
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('movie'))),
     n_filtered AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IS NULL),
     ci_filtered AS
  (SELECT movie_id,
          person_id
   FROM cast_info
   WHERE note IS NULL
     AND role_id IN
       (SELECT id
        FROM role_type
        WHERE ROLE IN ('actress'))),
     mi1_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('3')
     AND info IN ('Action',
                    'Adventure',
                    'Family',
                    'Musical',
                    'Thriller',
                    'War',
                    'Western')),
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
     AND info::float BETWEEN 0.0 AND 8.0),
     pi1_filtered AS
  (SELECT person_id
   FROM person_info
   WHERE info_type_id IN ('26'))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN ci_filtered AS ci ON t.id = ci.movie_id
JOIN n_filtered AS n ON ci.person_id = n.id
JOIN mi1_filtered AS mi1 ON t.id = mi1.movie_id
JOIN mii1_filtered AS mii1 ON t.id = mii1.movie_id
JOIN mii2_filtered AS mii2 ON t.id = mii2.movie_id
JOIN pi1_filtered AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id;