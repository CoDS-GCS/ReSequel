WITH filtered_kt AS
  (SELECT id
   FROM kind_type
   WHERE kind IN ('episode',
                   'movie')),
     filtered_it AS
  (SELECT id
   FROM info_type
   WHERE id IN ('18')),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'actress')),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE (gender IN ('f',
                    'm')
          OR gender IS NULL)
     AND (name_pcode_nf IN ('A4163',
                           'B1626',
                           'C6231',
                           'C6421',
                           'C6425',
                           'E4213',
                           'F6521',
                           'J5425',
                           'R1631',
                           'R1635',
                           'R2631',
                           'S3152')
          OR name_pcode_nf IS NULL)),
     filtered_cn AS
  (SELECT id
   FROM company_name
   WHERE name IN ('Columbia Broadcasting System (CBS)',
                   'Metro-Goldwyn-Mayer (MGM)',
                   'Warner Home Video')),
     filtered_ct AS
  (SELECT id
   FROM company_type
   WHERE kind IN ('distributors',
                   'production companies'))
SELECT COUNT(*)
FROM title AS t
JOIN filtered_kt kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN filtered_it it1 ON mi1.info_type_id = it1.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_rt rt ON ci.role_id = rt.id
JOIN filtered_n n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN filtered_ct ct ON mc.company_type_id = ct.id
JOIN filtered_cn cn ON mc.company_id = cn.id
WHERE t.production_year BETWEEN 1925 AND 1975
  AND mi1.info IN ('CBS Studio Center - 4024 Radford Avenue, Studio City, Los Angeles, California, USA',
                    'Metro-Goldwyn-Mayer Studios - 10202 W. Washington Blvd., Culver City, California, USA',
                    'New York City, New York, USA');