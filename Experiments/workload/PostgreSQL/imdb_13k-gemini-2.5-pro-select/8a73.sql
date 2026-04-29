
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_name AS cn ON mc.company_id = cn.id
JOIN company_type AS ct ON mc.company_type_id = ct.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND kt.kind IN ('episode')
  AND ct.kind IN ('distributors',
                   'production companies')
  AND cn.name IN ('Columbia Broadcasting System (CBS)',
                   'Metro-Goldwyn-Mayer (MGM)',
                   'Paramount Pictures',
                   'Pathé Frères',
                   'Universal Pictures',
                   'Warner Home Video')
  AND it1.id IN ('1')
  AND mi1.info IN ('USA:30',
                    'USA:60')
  AND rt.role IN ('actress',
                   'costume designer')
  AND n.gender IN ('f')
  AND (n.surname_pcode IN ('B2',
                           'B4',
                           'C2',
                           'C5',
                           'D5',
                           'H63',
                           'L52',
                           'M25',
                           'P62',
                           'W425',
                           'W452')
       OR n.surname_pcode IS NULL);