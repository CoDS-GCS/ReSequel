WITH filtered_t AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND kt.kind IN ('episode',
                   'movie')),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE (gender IN ('m')
          OR gender IS NULL)
     AND name_pcode_nf IN ('A4236',
                           'A6361',
                           'A6362',
                           'J5235',
                           'J5243',
                           'M2415',
                           'M2423',
                           'M4245',
                           'M6216',
                           'M6252',
                           'M6354',
                           'S3151')),
     filtered_ci AS
  (SELECT movie_id,
          person_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE ci.note IS NULL
     AND rt.role IN ('actor'))
SELECT COUNT(*)
FROM filtered_t t
JOIN filtered_ci ci ON t.id = ci.movie_id
JOIN filtered_n n ON ci.person_id = n.id
JOIN movie_info mi1 ON t.id = mi1.movie_id
JOIN movie_info_idx mii1 ON t.id = mii1.movie_id
JOIN movie_info_idx mii2 ON t.id = mii2.movie_id
JOIN person_info pi1 ON n.id = pi1.person_id
JOIN aka_name an ON n.id = an.person_id
WHERE mi1.info_type_id IN ('18',
                  '7')
  AND mi1.info IN ('OFM:Live',
                    'PCS:Spherical',
                    'PFM:35 mm',
                    'PFM:Video',
                    'RAT:1.33 : 1',
                    'RAT:1.37 : 1',
                    'RAT:2.35 : 1')
  AND mii1.info_type_id = '100'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float BETWEEN 5000.0 AND 500000.0
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float BETWEEN 2.0 AND 5.0
  AND pi1.info_type_id IN ('31');