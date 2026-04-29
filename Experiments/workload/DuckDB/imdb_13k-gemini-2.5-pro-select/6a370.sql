WITH filtered_ci AS
  (SELECT movie_id,
          person_id
   FROM cast_info
   WHERE note IS NULL
     AND role_id IN
       (SELECT id
        FROM role_type
        WHERE ROLE IN ('actress')))
SELECT COUNT(*)
FROM filtered_ci
JOIN title t ON t.id = filtered_ci.movie_id
JOIN name n ON n.id = filtered_ci.person_id
JOIN movie_info mi1 ON mi1.movie_id = filtered_ci.movie_id
JOIN movie_info_idx mii1 ON mii1.movie_id = filtered_ci.movie_id
JOIN movie_info_idx mii2 ON mii2.movie_id = filtered_ci.movie_id
JOIN person_info pi1 ON pi1.person_id = filtered_ci.person_id
JOIN aka_name an ON an.person_id = filtered_ci.person_id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie'))
  AND n.gender IN ('f')
  AND n.name_pcode_nf IN ('A4253',
                           'A5216',
                           'A5263',
                           'A5264',
                           'B6164',
                           'F6523',
                           'G1642',
                           'J5162',
                           'K3652',
                           'M6243',
                           'M6254',
                           'M6523',
                           'S1524',
                           'T6252')
  AND mi1.info_type_id IN ('13',
                  '3')
  AND mi1.info IN ('Animation',
                    'Comedy',
                    'Crime',
                    'Drama',
                    'Horror',
                    'Romance',
                    'Short',
                    'Thriller')
  AND mii1.info_type_id = '100'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float BETWEEN 0.0 AND 10000.0
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float BETWEEN 7.0 AND 11.0
  AND pi1.info_type_id IN ('37');