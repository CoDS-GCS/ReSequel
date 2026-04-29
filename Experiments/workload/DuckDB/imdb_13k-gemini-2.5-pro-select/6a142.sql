WITH movie_cast AS
  (SELECT t.id AS movie_id,
          ci.person_id,
          ci.role_id,
          ci.note
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN cast_info AS ci ON t.id = ci.movie_id
   WHERE kt.kind IN ('movie')
     AND t.production_year BETWEEN 1875 AND 1975)
SELECT COUNT(*)
FROM movie_cast AS mc
JOIN movie_info AS mi1 ON mc.movie_id = mi1.movie_id
JOIN movie_info_idx AS mii1 ON mc.movie_id = mii1.movie_id
JOIN movie_info_idx AS mii2 ON mc.movie_id = mii2.movie_id
JOIN role_type AS rt ON mc.role_id = rt.id
JOIN name AS n ON mc.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
WHERE (mc.note IN ('(producer)',
                   '(uncredited)')
       OR mc.note IS NULL)
  AND mi1.info_type_id IN ('18',
                  '2',
                  '5')
  AND mi1.info IN ('Finland:S',
                    'Sweden:15',
                    'UK:U',
                    'USA:Passed')
  AND mii1.info_type_id = '100'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float BETWEEN 5000.0 AND 500000.0
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float BETWEEN 7.0 AND 11.0
  AND rt.role IN ('actor',
                   'producer')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND n.name_pcode_nf IN ('E3632',
                           'F6362',
                           'F6523',
                           'F6524',
                           'F6526',
                           'F6532',
                           'G6216',
                           'H6163',
                           'R1636',
                           'R2632',
                           'S2534',
                           'V4356',
                           'W4362')
  AND pi1.info_type_id IN ('31');