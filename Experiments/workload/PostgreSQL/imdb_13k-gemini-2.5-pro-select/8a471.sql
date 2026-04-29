WITH filtered_mc AS
  (SELECT mc.movie_id
   FROM movie_companies AS mc
   JOIN company_name AS cn ON mc.company_id = cn.id
   JOIN company_type AS ct ON mc.company_type_id = ct.id
   WHERE cn.name IN ('American Broadcasting Company (ABC)',
                   'Columbia Broadcasting System (CBS)',
                   'National Broadcasting Company (NBC)')
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
WHERE t.production_year BETWEEN 1925 AND 1975
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
  AND it1.id IN ('7')
  AND mi1.info IN ('LAB:DeLuxe',
                    'PCS:Spherical',
                    'RAT:1.85 : 1')
  AND rt.role IN ('actress')
  AND n.gender IN ('f')
  AND (n.name_pcode_nf IN ('C6235',
                           'D5162',
                           'E4213',
                           'J5215')
       OR n.name_pcode_nf IS NULL);