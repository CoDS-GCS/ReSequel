
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN title AS t ON ci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
WHERE kt.kind IN ('episode',
                   'movie')
  AND t.production_year BETWEEN 1975 AND 2015
  AND mi1.info_type_id IN ('13',
                  '18',
                  '8')
  AND mi1.info IN ('Austria',
                    'Finland',
                    'Greece',
                    'Hong Kong',
                    'Israel',
                    'London, England, UK',
                    'Poland',
                    'Portugal',
                    'South Korea',
                    'Soviet Union',
                    'Sweden',
                    'Switzerland',
                    'Toronto, Ontario, Canada',
                    'Turkey',
                    'West Germany')
  AND mii1.info_type_id = '100'
  AND (mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii1.info::float BETWEEN 0.0 AND 10000.0)
  AND mii2.info_type_id = '101'
  AND (mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii2.info::float BETWEEN 2.0 AND 5.0)
  AND n.gender IN ('m')
  AND n.name_pcode_nf IN ('A3562',
                           'B6534',
                           'C6241',
                           'C6435',
                           'E3634',
                           'H5252',
                           'J5236',
                           'J5426',
                           'L2125',
                           'L2142',
                           'L6521',
                           'M3265',
                           'O4165',
                           'T5212',
                           'T5256')
  AND pi1.info_type_id IN ('31')
  AND rt.role IN ('actor',
                   'producer')
  AND (ci.note IN ('(executive producer)')
       OR ci.note IS NULL);