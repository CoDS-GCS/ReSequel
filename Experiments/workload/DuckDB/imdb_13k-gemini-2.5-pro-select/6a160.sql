WITH filtered_ci AS
  (SELECT movie_id,
          person_id
   FROM cast_info
   WHERE note IS NULL
     AND role_id IN
       (SELECT id
        FROM role_type
        WHERE ROLE IN ('actor',
                   'actress')))
SELECT COUNT(*)
FROM filtered_ci
JOIN title t ON t.id = filtered_ci.movie_id
JOIN name n ON n.id = filtered_ci.person_id
JOIN movie_info mi1 ON mi1.movie_id = filtered_ci.movie_id
JOIN movie_info_idx mii1 ON mii1.movie_id = filtered_ci.movie_id
JOIN movie_info_idx mii2 ON mii2.movie_id = filtered_ci.movie_id
JOIN person_info pi1 ON pi1.person_id = filtered_ci.person_id
JOIN aka_name an ON an.person_id = filtered_ci.person_id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie'))
  AND n.gender IN ('f',
                    'm')
  AND n.name_pcode_nf IN ('A4215',
                           'B6232',
                           'C6542',
                           'D5423',
                           'G5362',
                           'G6435',
                           'J6525',
                           'L6521',
                           'M5416',
                           'N3425',
                           'W4562')
  AND mi1.info_type_id IN ('5')
  AND mi1.info IN ('Australia:G',
                    'Australia:M',
                    'France:U',
                    'Netherlands:12',
                    'Portugal:M/12',
                    'UK:15',
                    'USA:Not Rated',
                    'USA:R')
  AND mii1.info_type_id = '100'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float BETWEEN 0.0 AND 10000.0
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float BETWEEN 3.0 AND 7.0
  AND pi1.info_type_id IN ('25');