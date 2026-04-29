
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_type AS ct ON mc.company_type_id = ct.id
JOIN company_name AS cn ON mc.company_id = cn.id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND kt.kind IN ('movie')
  AND it1.id IN ('3')
  AND mi1.info IN ('Adventure',
                    'Fantasy',
                    'Music',
                    'Musical',
                    'Mystery',
                    'Sci-Fi',
                    'War')
  AND rt.role IN ('actress',
                   'cinematographer',
                   'miscellaneous crew')
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.surname_pcode IN ('L',
                           'R2',
                           'S53')
       OR n.surname_pcode IS NULL)
  AND cn.name IN ('Metro-Goldwyn-Mayer (MGM)',
                   'Paramount Pictures',
                   'Warner Home Video')
  AND ct.kind IN ('distributors');