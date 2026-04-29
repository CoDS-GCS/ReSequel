WITH filtered_persons AS
  (SELECT n.id AS person_id
   FROM name AS n
   JOIN aka_name AS an ON n.id = an.person_id
   JOIN person_info AS pi1 ON n.id = pi1.person_id
   WHERE (n.gender IN ('f')
          OR n.gender IS NULL)
     AND n.name_pcode_nf IN ('A525',
                           'A5363',
                           'C6235',
                           'C6525',
                           'D525',
                           'E4525',
                           'J5245',
                           'L252',
                           'M62',
                           'M6245',
                           'M6532',
                           'M6562',
                           'R5316',
                           'S652')
     AND pi1.info_type_id IN ('22'))
SELECT COUNT(*)
FROM filtered_persons AS fp
JOIN cast_info AS ci ON fp.person_id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN title AS t ON ci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
WHERE (ci.note IN ('(producer)',
                   '(supervising producer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actress',
                   'producer')
  AND kt.kind IN ('episode',
                   'movie')
  AND t.production_year BETWEEN 1975 AND 2015
  AND mi1.info_type_id IN ('5',
                  '7')
  AND mi1.info IN ('Argentina:16',
                    'CAM:Panavision Cameras and Lenses',
                    'Canada:PG',
                    'France:U',
                    'Germany:12',
                    'Germany:16',
                    'Iceland:16',
                    'PCS:Super 35',
                    'PFM:16 mm',
                    'RAT:1.37 : 1',
                    'RAT:1.78 : 1 / (high definition)',
                    'Sweden:15',
                    'UK:18',
                    'UK:PG',
                    'USA:Not Rated',
                    'USA:TV-PG')
  AND mii1.info_type_id = '100'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float BETWEEN 0.0 AND 10000.0
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float BETWEEN 7.0 AND 11.0;