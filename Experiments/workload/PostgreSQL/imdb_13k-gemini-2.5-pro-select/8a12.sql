WITH filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IS NULL
     AND surname_pcode IS NULL),
     filtered_cn AS
  (SELECT id
   FROM company_name
   WHERE name IN ('Columbia Broadcasting System (CBS)',
                   'Metro-Goldwyn-Mayer (MGM)',
                   'Warner Home Video'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_type AS ct ON mc.company_type_id = ct.id
JOIN filtered_cn AS cn ON mc.company_id = cn.id
WHERE t.production_year BETWEEN 1925 AND 1975
  AND kt.kind IN ('episode')
  AND it1.id IN ('1')
  AND mi1.info IN ('USA:30',
                    'USA:60')
  AND rt.role IN ('director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND ct.kind IN ('distributors',
                   'production companies');