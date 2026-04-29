WITH filtered_persons AS
  (SELECT n.id AS person_id
   FROM name AS n
   JOIN aka_name AS an ON n.id = an.person_id
   JOIN person_info AS pi1 ON n.id = pi1.person_id
   WHERE (n.gender IN ('f')
          OR n.gender IS NULL)
     AND n.name_pcode_nf IN ('A4253',
                           'A5354',
                           'C3654',
                           'C6231',
                           'G6252',
                           'J2152',
                           'J23',
                           'M2426',
                           'M6215',
                           'M6312',
                           'M6542',
                           'R2414',
                           'S1652',
                           'W5245')
     AND pi1.info_type_id IN ('26'))
SELECT COUNT(*)
FROM filtered_persons AS fp
JOIN cast_info AS ci ON fp.person_id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN title AS t ON ci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
WHERE (ci.note IN ('(writer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actress',
                   'editor',
                   'writer')
  AND kt.kind IN ('episode',
                   'movie')
  AND t.production_year BETWEEN 1925 AND 2015
  AND mi1.info_type_id IN ('15',
                  '5')
  AND mi1.info IN ('Argentina:13',
                    'Argentina:Atp',
                    'Finland:K-16',
                    'Netherlands:12',
                    'Singapore:PG',
                    'Sweden:15',
                    'UK:15',
                    'UK:18',
                    'UK:PG',
                    'USA:Approved',
                    'USA:Not Rated',
                    'USA:Passed',
                    'USA:R',
                    'USA:TV-14')
  AND mii1.info_type_id = '100'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float BETWEEN 0.0 AND 10000.0
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float BETWEEN 2.0 AND 5.0;