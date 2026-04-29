WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   WHERE t.kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('tv movie',
                   'video movie'))
     AND t.production_year BETWEEN 1925 AND 2015
     AND EXISTS
       (SELECT 1
        FROM movie_info mi1
        WHERE mi1.movie_id = t.id
          AND mi1.info_type_id IN ('6')
          AND mi1.info IN ('Mono'))
     AND EXISTS
       (SELECT 1
        FROM movie_info_idx mii1
        WHERE mii1.movie_id = t.id
          AND mii1.info_type_id = '100'
          AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
          AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
          AND mii1.info::float BETWEEN 0.0 AND 10000.0)
     AND EXISTS
       (SELECT 1
        FROM movie_info_idx mii2
        WHERE mii2.movie_id = t.id
          AND mii2.info_type_id = '101'
          AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
          AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
          AND mii2.info::float BETWEEN 0.0 AND 4.0)),
     filtered_persons AS
  (SELECT n.id
   FROM name AS n
   JOIN person_info AS pi ON n.id = pi.person_id
   JOIN aka_name AS an ON n.id = an.person_id
   WHERE n.gender IN ('f',
                    'm')
     AND (n.name_pcode_nf IN ('A5362',
                           'B6535',
                           'C6231',
                           'C6235',
                           'E4213',
                           'F6521',
                           'F6525',
                           'K6235',
                           'R1632',
                           'S3152')
          OR n.name_pcode_nf IS NULL)
     AND pi.info_type_id IN ('19'))
SELECT COUNT(*)
FROM cast_info AS ci
JOIN filtered_movies AS fm ON ci.movie_id = fm.id
JOIN filtered_persons AS fp ON ci.person_id = fp.id
WHERE (ci.note IN ('(archive footage)')
       OR ci.note IS NULL)
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'actress'));