WITH filtered_mc AS
  (SELECT mc.movie_id
   FROM movie_companies AS mc
   JOIN company_name AS cn ON mc.company_id = cn.id
   JOIN company_type AS ct ON mc.company_type_id = ct.id
   WHERE cn.name IN ('American Broadcasting Company (ABC)',
                   'Columbia Broadcasting System (CBS)',
                   'Pathé Frères',
                   'Universal Film Manufacturing Company')
     AND ct.kind IN ('distributors'))
SELECT COUNT(*)
FROM filtered_mc
JOIN title AS t ON filtered_mc.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND kt.kind IN ('episode',
                   'movie')
  AND it1.id IN ('5')
  AND mi1.info IN ('Australia:G',
                    'Netherlands:12',
                    'Sweden:15')
  AND rt.role IN ('actor',
                   'producer')
  AND n.gender IN ('m')
  AND (n.name_pcode_nf IN ('C6231',
                           'C6425',
                           'F6525',
                           'J5216',
                           'J5252',
                           'J5425',
                           'R1631',
                           'R1632',
                           'R1636',
                           'R2631',
                           'R2632',
                           'R2635')
       OR n.name_pcode_nf IS NULL);