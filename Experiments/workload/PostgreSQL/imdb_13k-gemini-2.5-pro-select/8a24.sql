WITH filtered_titles AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 1975
     AND kt.kind IN ('movie',
                   'tv series',
                   'video movie'))
SELECT COUNT(*)
FROM filtered_titles AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN company_type AS ct ON mc.company_type_id = ct.id
JOIN company_name AS cn ON mc.company_id = cn.id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE rt.role IN ('actor',
                   'actress',
                   'producer')
  AND n.gender IN ('f',
                    'm')
  AND n.name_pcode_cf IN ('B4525',
                           'B6261',
                           'D1232',
                           'H4236',
                           'O4252',
                           'P6252',
                           'R363',
                           'S3152',
                           'W5165')
  AND ct.kind IN ('distributors',
                   'production companies')
  AND cn.name IN ('Columbia Broadcasting System (CBS)',
                   'Metro-Goldwyn-Mayer (MGM)',
                   'Warner Home Video')
  AND it1.id IN ('4')
  AND mi1.info IN ('English',
                    'French');