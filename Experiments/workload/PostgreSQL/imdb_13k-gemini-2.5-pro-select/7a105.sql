WITH core_movies AS
  (SELECT mii1.movie_id
   FROM movie_info_idx AS mii1
   JOIN movie_info_idx AS mii2 ON mii1.movie_id = mii2.movie_id
   WHERE mii1.info_type_id = '100'
     AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii1.info::float BETWEEN 0.0 AND 10000.0
     AND mii2.info_type_id = '101'
     AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii2.info::float BETWEEN 7.0 AND 11.0),
     qualifying_persons AS
  (SELECT n.id
   FROM name AS n
   JOIN person_info AS pi1 ON n.id = pi1.person_id
   WHERE n.gender IN ('m')
     AND n.name_pcode_nf IN ('C6231',
                           'D5436',
                           'E6236',
                           'G6263',
                           'G6326',
                           'H2525',
                           'J153',
                           'J2545',
                           'P436',
                           'R3261',
                           'S3632')
     AND pi1.info_type_id IN ('19'))
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
  AND mi1.info_type_id IN ('103',
                  '11',
                  '5')
  AND mi1.info IN ('Australia:MA',
                    'Canada:PG',
                    'France:U',
                    'Germany:16',
                    'Iceland:L',
                    'Netherlands:16',
                    'Netherlands:AL',
                    'USA:TV-PG',
                    'USA:Unrated',
                    'West Germany:16')
  AND (ci.note IN ('(executive producer)',
                   '(voice)')
       OR ci.note IS NULL)
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'director',
                   'producer'));