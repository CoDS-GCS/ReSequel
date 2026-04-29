WITH filtered_persons AS
  (SELECT n.id AS person_id
   FROM name AS n
   JOIN aka_name AS an ON n.id = an.person_id
   JOIN person_info AS pi1 ON n.id = pi1.person_id
   WHERE (n.gender IN ('f')
          OR n.gender IS NULL)
     AND n.name_pcode_nf IN ('A5162',
                           'A5165',
                           'A525',
                           'C5321',
                           'L5324',
                           'M6214',
                           'M6265',
                           'M6342',
                           'M6352',
                           'N2416',
                           'P3625',
                           'S4123')
     AND pi1.info_type_id IN ('19'))
SELECT COUNT(*)
FROM filtered_persons AS fp
JOIN cast_info AS ci ON fp.person_id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN title AS t ON ci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
WHERE (ci.note IN ('(producer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actress',
                   'producer')
  AND kt.kind IN ('episode',
                   'movie')
  AND t.production_year BETWEEN 1925 AND 2015
  AND mi1.info_type_id IN ('5')
  AND mi1.info IN ('Canada:PG',
                    'France:U',
                    'Germany:12',
                    'Germany:16',
                    'Iceland:16',
                    'India:U',
                    'Netherlands:AL',
                    'Sweden:Btl',
                    'UK:U',
                    'West Germany:12',
                    'West Germany:16')
  AND mii1.info_type_id = '100'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float BETWEEN 1000.0 AND 10000.0
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float BETWEEN 7.0 AND 11.0;