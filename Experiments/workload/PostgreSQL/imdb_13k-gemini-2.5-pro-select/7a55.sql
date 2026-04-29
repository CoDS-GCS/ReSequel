WITH core_join AS
  (SELECT t.id AS movie_id,
          n.id AS person_id
   FROM title t
   JOIN cast_info ci ON t.id = ci.movie_id
   JOIN name n ON ci.person_id = n.id
   JOIN kind_type kt ON t.kind_id = kt.id
   JOIN role_type rt ON ci.role_id = rt.id
   WHERE kt.kind IN ('movie')
     AND t.production_year BETWEEN 1875 AND 1975
     AND rt.role IN ('actor')
     AND (ci.note IN ('(uncredited)')
          OR ci.note IS NULL)
     AND n.gender IN ('m')
     AND (n.name_pcode_nf IN ('A4253',
                           'A5352',
                           'A5362',
                           'C6421',
                           'C6423',
                           'C6424',
                           'C6425',
                           'E6523',
                           'F6521',
                           'F6524',
                           'F6525',
                           'R1631',
                           'R1632')
          OR n.name_pcode_nf IS NULL))
SELECT COUNT(*)
FROM core_join cj
JOIN movie_info mi1 ON cj.movie_id = mi1.movie_id
JOIN movie_info_idx mii1 ON cj.movie_id = mii1.movie_id
JOIN movie_info_idx mii2 ON cj.movie_id = mii2.movie_id
JOIN movie_keyword mk ON cj.movie_id = mk.movie_id
JOIN person_info pi1 ON cj.person_id = pi1.person_id
JOIN aka_name an ON cj.person_id = an.person_id
WHERE mi1.info_type_id IN ('13',
                  '3',
                  '94')
  AND mi1.info IN ('Animation',
                    'Comedy',
                    'Crime',
                    'Documentary',
                    'Drama',
                    'Romance',
                    'Short',
                    'Western')
  AND mii1.info_type_id = '100'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float BETWEEN 0.0 AND 1000.0
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float BETWEEN 3.0 AND 7.0
  AND pi1.info_type_id IN ('37');