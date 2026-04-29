WITH movie_base AS
  (SELECT t.id AS movie_id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE kt.kind IN ('episode',
                   'movie')
     AND t.production_year BETWEEN 1950 AND 1990),
     person_base AS
  (SELECT n.id AS person_id
   FROM name AS n
   JOIN person_info AS pi1 ON n.id = pi1.person_id
   WHERE n.gender IN ('f',
                    'm')
     AND n.name_pcode_nf IN ('A4253',
                           'A5356',
                           'E3631',
                           'G6253',
                           'G6262',
                           'M6126',
                           'M6241',
                           'M6252',
                           'P3625',
                           'S2525',
                           'S3541',
                           'V2362',
                           'W4525')
     AND pi1.info_type_id IN ('26'))
SELECT COUNT(*)
FROM movie_base mb
JOIN movie_info mi1 ON mb.movie_id = mi1.movie_id
JOIN movie_info_idx mii1 ON mb.movie_id = mii1.movie_id
JOIN movie_info_idx mii2 ON mb.movie_id = mii2.movie_id
JOIN movie_keyword mk ON mb.movie_id = mk.movie_id
JOIN cast_info ci ON mb.movie_id = ci.movie_id
JOIN person_base pb ON ci.person_id = pb.person_id
JOIN aka_name an ON pb.person_id = an.person_id
JOIN role_type rt ON ci.role_id = rt.id
WHERE mi1.info_type_id IN ('4')
  AND mi1.info IN ('English',
                    'Filipino',
                    'French',
                    'German',
                    'Italian',
                    'Spanish')
  AND mii1.info_type_id = '100'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float BETWEEN 0.0 AND 10000.0
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float BETWEEN 2.0 AND 5.0
  AND (ci.note IN ('(executive producer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'actress',
                   'producer');