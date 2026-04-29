
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
WHERE kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND t.production_year BETWEEN 1975 AND 2015
  AND EXISTS
    (SELECT 1
     FROM movie_info AS mi1
     WHERE mi1.movie_id = t.id
       AND mi1.info_type_id IN ('1',
                  '17',
                  '5')
       AND mi1.info IN ('60'))
  AND EXISTS
    (SELECT 1
     FROM movie_info_idx mii
     WHERE mii.movie_id = t.id
     GROUP BY mii.movie_id
     HAVING SUM(CASE
                    WHEN mii.info_type_id = '100'
                         AND mii.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
                         AND mii.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
                         AND mii.info::float BETWEEN 0.0 AND 500.0 THEN 1
                    ELSE 0
                END) > 0
     AND SUM(CASE
                 WHEN mii.info_type_id = '101'
                      AND mii.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
                      AND mii.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
                      AND mii.info::float BETWEEN 8.0 AND 10.0 THEN 1
                 ELSE 0
             END) > 0)
  AND EXISTS
    (SELECT 1
     FROM movie_keyword AS mk
     JOIN keyword AS k ON mk.keyword_id = k.id
     WHERE mk.movie_id = t.id);