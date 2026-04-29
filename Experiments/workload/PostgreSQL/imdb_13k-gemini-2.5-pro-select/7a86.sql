WITH core_movies AS
  (SELECT mii1.movie_id
   FROM movie_info_idx AS mii1
   JOIN movie_info_idx AS mii2 ON mii1.movie_id = mii2.movie_id
   WHERE mii1.info_type_id = '100'
     AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii1.info::float BETWEEN 0.0 AND 1000.0
     AND mii2.info_type_id = '101'
     AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii2.info::float BETWEEN 3.0 AND 7.0),
     qualifying_persons AS
  (SELECT n.id
   FROM name AS n
   JOIN person_info AS pi1 ON n.id = pi1.person_id
   WHERE n.gender IN ('m')
     AND n.name_pcode_nf IN ('A4521',
                           'D5241',
                           'H2365',
                           'H5216',
                           'J5161',
                           'J5236',
                           'J5352',
                           'P435',
                           'S53',
                           'T6525')
     AND pi1.info_type_id IN ('32'))
SELECT COUNT(*)
FROM core_movies cm
JOIN title t ON t.id = cm.movie_id
JOIN movie_info mi1 ON t.id = mi1.movie_id
JOIN movie_keyword mk ON t.id = mk.movie_id
JOIN cast_info ci ON t.id = ci.movie_id
JOIN qualifying_persons qp ON ci.person_id = qp.id
JOIN aka_name an ON qp.id = an.person_id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie'))
  AND mi1.info_type_id IN ('11',
                  '110',
                  '4')
  AND mi1.info IN ('Dutch',
                    'French',
                    'Greek',
                    'Hindi',
                    'Italian',
                    'Japanese',
                    'Mandarin',
                    'Portuguese',
                    'Russian',
                    'Spanish',
                    'Tagalog')
  AND (ci.note IN ('(executive producer)')
       OR ci.note IS NULL)
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'producer'));