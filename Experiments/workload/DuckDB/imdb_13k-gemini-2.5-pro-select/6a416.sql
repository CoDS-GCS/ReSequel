WITH t_filtered AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 2015
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie'))),
     mi1_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('18')
     AND info IN ('Buenos Aires, Federal District, Argentina',
                    'London, England, UK',
                    'Los Angeles, California, USA',
                    'Mexico',
                    'New York City, New York, USA',
                    'Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA')),
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
     AND (name_pcode_nf IN ('A5362',
                           'A5365',
                           'C6235',
                           'C6453',
                           'D1312',
                           'D1343',
                           'H5163',
                           'J212',
                           'J532',
                           'S3154')
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
WHERE (ci.note IN ('(production assistant)',
                   '(writer)')
       OR ci.note IS NULL)
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'actress',
                   'cinematographer',
                   'editor',
                   'miscellaneous crew',
                   'writer'))
  AND pi1.info_type_id IN ('22');