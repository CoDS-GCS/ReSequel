WITH filtered_ci AS
  (SELECT movie_id,
          person_id
   FROM cast_info
   WHERE note IS NULL
     AND role_id IN
       (SELECT id
        FROM role_type
        WHERE ROLE IN ('actress',
                   'director')))
SELECT COUNT(*)
FROM filtered_ci
JOIN title t ON t.id = filtered_ci.movie_id
JOIN name n ON n.id = filtered_ci.person_id
JOIN movie_info mi1 ON mi1.movie_id = filtered_ci.movie_id
JOIN movie_info_idx mii1 ON mii1.movie_id = filtered_ci.movie_id
JOIN movie_info_idx mii2 ON mii2.movie_id = filtered_ci.movie_id
JOIN person_info pi1 ON pi1.person_id = filtered_ci.person_id
JOIN aka_name an ON an.person_id = filtered_ci.person_id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie'))
  AND n.gender IN ('f')
  AND n.name_pcode_nf IN ('A4262',
                           'C6232',
                           'C6521',
                           'E4516',
                           'I6526',
                           'J5265',
                           'J5616',
                           'L2425',
                           'M4532',
                           'M6234',
                           'S4125',
                           'S5162')
  AND mi1.info_type_id IN ('1',
                  '12')
  AND mi1.info IN ('100',
                    '11',
                    '13',
                    '14',
                    '16',
                    '17',
                    '22',
                    '25',
                    '3',
                    '45',
                    '95',
                    'USA:30')
  AND mii1.info_type_id = '100'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float BETWEEN 0.0 AND 10000.0
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float BETWEEN 7.0 AND 11.0
  AND pi1.info_type_id IN ('37');