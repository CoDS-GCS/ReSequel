
SELECT COUNT(*)
FROM
  (SELECT t.id AS movie_id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   AND kt.kind IN ('episode',
                   'movie')
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   AND mi1.info IN ('Action',
                    'Animation',
                    'Comedy',
                    'Crime',
                    'Documentary',
                    'Drama',
                    'Family',
                    'Horror',
                    'Romance',
                    'Short',
                    'Thriller')
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   AND it1.id IN ('104',
                  '108',
                  '3')
   JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
   AND mii1.info_type_id = '100'
   AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
   AND mii1.info::float >= 5000.0
   AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
   AND mii1.info::float <= 500000.0
   JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
   AND mii2.info_type_id = '101'
   AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
   AND mii2.info::float <= 11.0
   AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
   AND mii2.info::float >= 7.0
   JOIN movie_keyword AS mk ON t.id = mk.movie_id
   WHERE t.production_year BETWEEN 1925 AND 2015) AS fm
JOIN
  (SELECT ci.movie_id,
          ci.person_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('actress',
                   'director')
   WHERE ci.note IS NULL) AS ci ON fm.movie_id = ci.movie_id
JOIN
  (SELECT n.id AS person_id
   FROM name AS n
   JOIN person_info AS pi1 ON n.id = pi1.person_id
   AND pi1.info_type_id IN ('32')
   JOIN aka_name AS an ON n.id = an.person_id
   WHERE (n.gender IN ('f')
          OR n.gender IS NULL)
     AND (n.name_pcode_nf IN ('A5263',
                           'A5316',
                           'A5352',
                           'A5362',
                           'B6161',
                           'B6232',
                           'C6451',
                           'J5164',
                           'M5326',
                           'M623',
                           'M6253',
                           'M6316')
          OR n.name_pcode_nf IS NULL)) AS fp ON ci.person_id = fp.person_id;