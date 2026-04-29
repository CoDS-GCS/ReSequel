
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
WHERE t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie'))
  AND t.production_year BETWEEN 1925 AND 2015
  AND mi1.info_type_id IN ('1',
                  '108')
  AND mi1.info IN ('100',
                    '14',
                    '16',
                    '17',
                    '18',
                    '22',
                    '23',
                    '24',
                    '25',
                    '45',
                    '75',
                    '80',
                    '88',
                    '92',
                    '93',
                    '95',
                    'USA:30')
  AND mii1.info_type_id = '100'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float BETWEEN 5000.0 AND 500000.0
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float BETWEEN 2.0 AND 5.0
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'producer'))
  AND (ci.note IN ('(producer)',
                   '(voice)')
       OR ci.note IS NULL)
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND n.name_pcode_nf IN ('B6216',
                           'D5424',
                           'E3635',
                           'E6523',
                           'H626',
                           'J1626',
                           'J25',
                           'J5353',
                           'M6212',
                           'M6261',
                           'R1632',
                           'T5263')
  AND pi1.info_type_id IN ('19');