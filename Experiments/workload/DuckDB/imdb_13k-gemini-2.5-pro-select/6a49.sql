WITH movie_ids AS
  (SELECT t.id
   FROM title AS t
   WHERE t.production_year BETWEEN 1925 AND 1975
     AND t.kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('movie')) INTERSECT SELECT mi1.movie_id
   FROM movie_info mi1
   WHERE mi1.info_type_id IN ('13',
                  '6')
     AND mi1.info IN ('Mono') INTERSECT SELECT mii1.movie_id
   FROM movie_info_idx mii1
   WHERE mii1.info_type_id = '100'
     AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii1.info::float BETWEEN 1000.0 AND 10000.0 INTERSECT SELECT mii2.movie_id
   FROM movie_info_idx mii2
   WHERE mii2.info_type_id = '101'
     AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii2.info::float BETWEEN 0.0 AND 4.0),
     person_ids AS
  (SELECT n.id
   FROM name AS n
   JOIN aka_name an ON n.id = an.person_id
   JOIN person_info pi ON n.id = pi.person_id
   WHERE (n.gender IN ('m')
          OR n.gender IS NULL)
     AND (n.name_pcode_nf IN ('A4163',
                           'A4253',
                           'A5352',
                           'A5362',
                           'C6425',
                           'F6521',
                           'F6525',
                           'R1632')
          OR n.name_pcode_nf IS NULL)
     AND pi.info_type_id IN ('26'))
SELECT COUNT(*)
FROM cast_info AS ci
JOIN movie_ids m ON ci.movie_id = m.id
JOIN person_ids p ON ci.person_id = p.id
WHERE (ci.note IN ('(uncredited)')
       OR ci.note IS NULL)
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor'));