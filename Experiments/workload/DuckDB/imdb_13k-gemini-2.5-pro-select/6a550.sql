WITH movie_details AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
   JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
   WHERE kt.kind IN ('movie')
     AND t.production_year BETWEEN 1925 AND 1975
     AND mi1.info_type_id IN ('1',
                  '5')
     AND mi1.info IN ('Finland:K-16',
                    'Sweden:15',
                    'USA:Approved')
     AND mii1.info_type_id = '100'
     AND (mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
          AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
          AND mii1.info::float BETWEEN 0.0 AND 10000.0)
     AND mii2.info_type_id = '101'
     AND (mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
          AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
          AND mii2.info::float BETWEEN 2.0 AND 5.0)),
     person_details AS
  (SELECT n.id
   FROM name AS n
   JOIN person_info AS pi1 ON n.id = pi1.person_id
   JOIN aka_name AS an ON n.id = an.person_id
   WHERE n.gender IN ('f',
                    'm')
     AND (n.name_pcode_nf IN ('A4253',
                           'A5352',
                           'A5362',
                           'F6521',
                           'F6525',
                           'M6263',
                           'R1632')
          OR n.name_pcode_nf IS NULL)
     AND pi1.info_type_id IN ('19'))
SELECT COUNT(*)
FROM cast_info AS ci
JOIN movie_details AS md ON ci.movie_id = md.id
JOIN person_details AS pd ON ci.person_id = pd.id
WHERE (ci.note IN ('(uncredited)')
       OR ci.note IS NULL)
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'actress'));