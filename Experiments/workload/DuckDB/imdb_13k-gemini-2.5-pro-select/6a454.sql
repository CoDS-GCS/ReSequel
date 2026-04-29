WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1950 AND 1990
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE (gender IN ('m')
          OR gender IS NULL)
     AND name_pcode_nf IN ('A4152',
                           'E3631',
                           'J5214',
                           'J5236',
                           'J5241',
                           'P3652',
                           'P3656',
                           'S3541',
                           'T5252',
                           'V2361')),
     filtered_ci AS
  (SELECT movie_id,
          person_id
   FROM cast_info
   WHERE note IS NULL
     AND role_id IN
       (SELECT id
        FROM role_type
        WHERE ROLE IN ('actor'))),
     filtered_mii1 AS
  (SELECT movie_id
   FROM movie_info_idx
   WHERE info_type_id = '100'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info::float BETWEEN 5000.0 AND 500000.0),
     filtered_mii2 AS
  (SELECT movie_id
   FROM movie_info_idx
   WHERE info_type_id = '101'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info::float BETWEEN 7.0 AND 11.0)
SELECT COUNT(*)
FROM filtered_t t
JOIN filtered_ci ci ON t.id = ci.movie_id
JOIN filtered_n n ON ci.person_id = n.id
JOIN filtered_mii1 mii1 ON t.id = mii1.movie_id
JOIN filtered_mii2 mii2 ON t.id = mii2.movie_id
JOIN movie_info mi1 ON t.id = mi1.movie_id
JOIN person_info pi1 ON n.id = pi1.person_id
JOIN aka_name an ON n.id = an.person_id
WHERE mi1.info_type_id IN ('107',
                  '5')
  AND mi1.info IN ('Australia:G',
                    'Finland:K-16',
                    'Sweden:15',
                    'USA:Approved',
                    'USA:R')
  AND pi1.info_type_id IN ('31');