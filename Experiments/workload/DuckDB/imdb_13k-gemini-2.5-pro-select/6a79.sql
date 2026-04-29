WITH qualified_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE kt.kind IN ('movie')
     AND t.production_year BETWEEN 1975 AND 2015
     AND EXISTS
       (SELECT 1
        FROM movie_info mi1
        JOIN info_type it1 ON mi1.info_type_id = it1.id
        WHERE mi1.movie_id = t.id
          AND mi1.info IN ('Arabic',
                    'Cantonese',
                    'Filipino',
                    'Greek',
                    'Korean',
                    'Malayalam',
                    'Mandarin',
                    'Tagalog')
          AND it1.id IN ('103',
                  '4'))
     AND EXISTS
       (SELECT 1
        FROM movie_info_idx mii1
        WHERE mii1.movie_id = t.id
          AND mii1.info_type_id = '100'
          AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
          AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
          AND mii1.info::float BETWEEN 0.0 AND 1000.0)
     AND EXISTS
       (SELECT 1
        FROM movie_info_idx mii2
        WHERE mii2.movie_id = t.id
          AND mii2.info_type_id = '101'
          AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
          AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
          AND mii2.info::float BETWEEN 0.0 AND 8.0))
SELECT COUNT(*)
FROM qualified_movies qm
JOIN cast_info AS ci ON qm.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE ci.note IS NULL
  AND rt.role IN ('director')
  AND EXISTS
    (SELECT 1
     FROM name n
     WHERE n.id = ci.person_id
       AND n.gender IS NULL
       AND n.name_pcode_nf IS NULL)
  AND EXISTS
    (SELECT 1
     FROM person_info pi1
     JOIN info_type it5 ON pi1.info_type_id = it5.id
     WHERE pi1.person_id = ci.person_id
       AND it5.id IN ('19'))
  AND EXISTS
    (SELECT 1
     FROM aka_name an
     WHERE an.person_id = ci.person_id);