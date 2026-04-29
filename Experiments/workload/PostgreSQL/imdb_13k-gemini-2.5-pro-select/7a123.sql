WITH movie_base AS
  (SELECT t.id AS movie_id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE kt.kind IN ('episode',
                   'movie')
     AND t.production_year BETWEEN 1975 AND 2015),
     person_base AS
  (SELECT n.id AS person_id
   FROM name AS n
   JOIN person_info AS pi1 ON n.id = pi1.person_id
   WHERE n.gender IN ('f',
                    'm')
     AND n.name_pcode_nf IN ('A5361',
                           'D52',
                           'D5432',
                           'F6521',
                           'F6535',
                           'J2165',
                           'J6241',
                           'M2412',
                           'M2425',
                           'M2435',
                           'M2452',
                           'M62',
                           'M6216',
                           'S3162',
                           'S5362')
     AND pi1.info_type_id IN ('19'))
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
WHERE mi1.info_type_id IN ('2',
                  '6')
  AND mi1.info IN ('Color',
                    'Dolby Digital',
                    'Mono',
                    'Stereo')
  AND mii1.info_type_id = '100'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float BETWEEN 1000.0 AND 10000.0
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float BETWEEN 2.0 AND 5.0
  AND (ci.note IN ('(executive producer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'actress',
                   'producer');