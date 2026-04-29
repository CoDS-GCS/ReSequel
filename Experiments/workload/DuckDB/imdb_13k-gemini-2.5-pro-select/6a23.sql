WITH filtered_movies AS
  (SELECT t.id AS movie_id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
   JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
   WHERE kt.kind IN ('episode',
                   'movie')
     AND t.production_year BETWEEN 1975 AND 2015
     AND mi1.info_type_id IN ('106',
                  '15',
                  '7')
     AND mi1.info IN ('OFM:35 mm',
                    'OFM:Video',
                    'PCS:Spherical',
                    'PFM:35 mm',
                    'RAT:1.33 : 1',
                    'RAT:1.78 : 1',
                    'RAT:16:9 HD')
     AND mii1.info_type_id = '100'
     AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii1.info::float BETWEEN 1000.0 AND 10000.0
     AND mii2.info_type_id = '101'
     AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii2.info::float BETWEEN 7.0 AND 11.0)
SELECT COUNT(*)
FROM filtered_movies AS fm
JOIN cast_info AS ci ON fm.movie_id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
WHERE (ci.note IN ('(voice)',
                   '(writer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'writer')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND n.name_pcode_nf IN ('A5363',
                           'A5365',
                           'B6516',
                           'F6524',
                           'F6526',
                           'J2363',
                           'J523',
                           'J6241',
                           'M2416',
                           'M6252',
                           'M6253',
                           'S3126')
  AND pi1.info_type_id IN ('19');