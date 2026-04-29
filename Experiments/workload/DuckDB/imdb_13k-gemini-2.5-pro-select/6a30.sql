WITH filtered_persons AS
  (SELECT n.id AS person_id
   FROM name AS n
   JOIN aka_name AS an ON n.id = an.person_id
   JOIN person_info AS pi1 ON n.id = pi1.person_id
   WHERE (n.gender IN ('f',
                    'm')
          OR n.gender IS NULL)
     AND n.name_pcode_nf IN ('A5365',
                           'C6421',
                           'D542',
                           'F6362',
                           'J2452',
                           'J5163',
                           'M2416',
                           'M2426',
                           'M6253',
                           'R54',
                           'S3153')
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
WHERE (ci.note IN ('(writer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'writer')
  AND kt.kind IN ('episode',
                   'movie')
  AND t.production_year BETWEEN 1925 AND 2015
  AND mi1.info_type_id IN ('12',
                  '18')
  AND mi1.info IN ('Metro-Goldwyn-Mayer Studios - 10202 W. Washington Blvd., Culver City, California, USA',
                    'Paris, France',
                    'Toronto, Ontario, Canada',
                    'Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA')
  AND mii1.info_type_id = '100'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float BETWEEN 1000.0 AND 10000.0
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float BETWEEN 0.0 AND 8.0;