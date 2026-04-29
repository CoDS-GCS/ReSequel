WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 1975
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('movie'))),
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
     AND info::float BETWEEN 3.0 AND 7.0),
     filtered_mi1 AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('16',
                  '3',
                  '5')
     AND info IN ('Action',
                    'Animation',
                    'Comedy',
                    'Crime',
                    'Documentary',
                    'Finland:K-16',
                    'Romance',
                    'Short',
                    'USA:Approved')),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     AND name_pcode_nf IN ('C6421',
                           'C6423',
                           'C6424',
                           'C6425',
                           'C6426',
                           'F6524',
                           'F6532',
                           'R1631',
                           'R2632',
                           'V4356')),
     filtered_pi1 AS
  (SELECT person_id
   FROM person_info
   WHERE info_type_id IN ('32')),
     filtered_ci AS
  (SELECT movie_id,
          person_id
   FROM cast_info
   WHERE (note IN ('(uncredited)')
          OR note IS NULL)
     AND role_id IN
       (SELECT id
        FROM role_type
        WHERE ROLE IN ('actor')))
SELECT COUNT(*)
FROM filtered_t t
JOIN filtered_mii1 mii1 ON t.id = mii1.movie_id
JOIN filtered_mii2 mii2 ON t.id = mii2.movie_id
JOIN filtered_mi1 mi1f ON t.id = mi1f.movie_id
JOIN movie_keyword mk ON t.id = mk.movie_id
JOIN filtered_ci ci ON t.id = ci.movie_id
JOIN filtered_n n ON ci.person_id = n.id
JOIN filtered_pi1 pi1 ON n.id = pi1.person_id
JOIN aka_name an ON n.id = an.person_id;