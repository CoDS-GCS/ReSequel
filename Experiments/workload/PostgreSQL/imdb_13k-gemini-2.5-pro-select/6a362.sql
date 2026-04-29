WITH qualified_cast AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   INNER JOIN name AS n ON ci.person_id = n.id
   INNER JOIN aka_name AS an ON n.id = an.person_id
   INNER JOIN person_info AS pi1 ON n.id = pi1.person_id
   INNER JOIN info_type AS it5 ON pi1.info_type_id = it5.id
   INNER JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE ci.note IS NULL
     AND rt.role IN ('actor',
                   'director')
     AND (n.gender IN ('m')
          OR n.gender IS NULL)
     AND n.name_pcode_nf IN ('C4162',
                           'D6235',
                           'F6323',
                           'F6352',
                           'G6254',
                           'K5452',
                           'L2526',
                           'M612',
                           'M6352',
                           'R3261',
                           'T526')
     AND it5.id IN ('31'))
SELECT COUNT(*)
FROM title AS t
INNER JOIN qualified_cast AS qc ON t.id = qc.movie_id
INNER JOIN kind_type AS kt ON t.kind_id = kt.id
INNER JOIN movie_info AS mi1 ON t.id = mi1.movie_id
INNER JOIN info_type AS it1 ON mi1.info_type_id = it1.id
INNER JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
INNER JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('episode',
                   'movie')
  AND mi1.info IN ('Arabic',
                    'Danish',
                    'Desilu Studios - 9336 W. Washington Blvd., Culver City, California, USA',
                    'Korean',
                    'London, England, UK',
                    'Malayalam',
                    'Metro-Goldwyn-Mayer Studios - 10202 W. Washington Blvd., Culver City, California, USA',
                    'None',
                    'Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Paris, France',
                    'Polish',
                    'Universal Studios - 100 Universal City Plaza, Universal City, California, USA',
                    'Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA')
  AND it1.id IN ('18',
                  '4')
  AND mii1.info_type_id = '100'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float BETWEEN 5000.0 AND 500000.0
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float BETWEEN 3.0 AND 7.0;