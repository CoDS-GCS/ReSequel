WITH core_cast AS
  (SELECT t.id AS movie_id,
          n.id AS person_id
   FROM title AS t
   JOIN cast_info AS ci ON t.id = ci.movie_id
   JOIN name AS n ON ci.person_id = n.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND t.kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie'))
     AND ci.note IS NULL
     AND ci.role_id IN
       (SELECT id
        FROM role_type
        WHERE ROLE IN ('actor'))
     AND (n.gender IN ('m')
          OR n.gender IS NULL)
     AND n.name_pcode_nf IN ('C6423',
                           'C6424',
                           'E3632',
                           'E6523',
                           'J513',
                           'M2425',
                           'M2426',
                           'M2452',
                           'P3616',
                           'R1634'))
SELECT COUNT(*)
FROM core_cast cc
JOIN movie_info mi1 ON cc.movie_id = mi1.movie_id
JOIN movie_info_idx mii1 ON cc.movie_id = mii1.movie_id
JOIN movie_info_idx mii2 ON cc.movie_id = mii2.movie_id
JOIN person_info pi1 ON cc.person_id = pi1.person_id
JOIN aka_name an ON cc.person_id = an.person_id
WHERE mi1.info_type_id IN ('16',
                  '18',
                  '4')
  AND mi1.info IN ('Greek',
                    'Mandarin',
                    'Metro-Goldwyn-Mayer Studios - 10202 W. Washington Blvd., Culver City, California, USA',
                    'Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Portuguese',
                    'Serbo-Croatian',
                    'Turkish',
                    'Universal Studios - 100 Universal City Plaza, Universal City, California, USA')
  AND mii1.info_type_id = '100'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float BETWEEN 0.0 AND 10000.0
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float BETWEEN 7.0 AND 11.0
  AND pi1.info_type_id IN ('37');