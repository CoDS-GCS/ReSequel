WITH filtered_mii1 AS
  (SELECT movie_id
   FROM movie_info_idx
   WHERE info_type_id = '100'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info::float BETWEEN 5000.0 AND 500000.0),
     filtered_mii2 AS
  (SELECT movie_id
   FROM movie_info_idx
   WHERE info_type_id = '101'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info::float BETWEEN 3.0 AND 7.0),
     filtered_t AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 2015
     AND kt.kind IN ('episode',
                   'movie')),
     filtered_mi1 AS
  (SELECT movie_id
   FROM movie_info mi
   JOIN info_type it ON mi.info_type_id = it.id
   WHERE mi.info IN ('Arabic',
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
     AND it.id IN ('18',
                  '4')),
     filtered_n AS
  (SELECT n.id
   FROM name AS n
   JOIN aka_name AS an ON n.id = an.person_id
   JOIN person_info AS pi ON n.id = pi.person_id
   JOIN info_type AS it ON pi.info_type_id = it.id
   WHERE (n.gender IN ('m')
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
     AND it.id IN ('31'))
SELECT COUNT(*)
FROM cast_info AS ci
INNER JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'director')
INNER JOIN filtered_t AS t ON ci.movie_id = t.id
INNER JOIN filtered_mi1 AS mi1 ON ci.movie_id = mi1.movie_id
INNER JOIN filtered_mii1 AS mii1 ON ci.movie_id = mii1.movie_id
INNER JOIN filtered_mii2 AS mii2 ON ci.movie_id = mii2.movie_id
INNER JOIN filtered_n AS n ON ci.person_id = n.id
WHERE ci.note IS NULL;