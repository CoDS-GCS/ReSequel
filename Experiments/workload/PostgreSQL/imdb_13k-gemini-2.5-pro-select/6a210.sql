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
   WHERE (gender IN ('f')
          OR gender IS NULL)
     AND name_pcode_nf IN ('A4253',
                           'A5242',
                           'J3261',
                           'J5162',
                           'K6235',
                           'M6232',
                           'M6252',
                           'S2525',
                           'S3521')),
     filtered_ci AS
  (SELECT movie_id,
          person_id
   FROM cast_info
   WHERE note IS NULL
     AND role_id IN
       (SELECT id
        FROM role_type
        WHERE ROLE IN ('actress',
                   'production designer'))),
     filtered_mii1 AS
  (SELECT movie_id
   FROM movie_info_idx
   WHERE info_type_id = '100'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info::float BETWEEN 1000.0 AND 10000.0),
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
WHERE mi1.info_type_id IN ('1',
                  '7',
                  '9')
  AND mi1.info IN ('30',
                    '60',
                    'OFM:35 mm',
                    'PCS:Spherical',
                    'PFM:Video',
                    'RAT:1.33 : 1',
                    'RAT:1.37 : 1')
  AND pi1.info_type_id IN ('31');