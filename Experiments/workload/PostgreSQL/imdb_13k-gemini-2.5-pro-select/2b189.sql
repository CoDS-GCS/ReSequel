WITH filtered_kt AS
  (SELECT id
   FROM kind_type
   WHERE kind IN ('episode',
                   'movie',
                   'video movie')),
     filtered_k AS
  (SELECT id
   FROM keyword
   WHERE keyword IN ('bang-bang',
                     'beneath-the-city',
                     'black-art',
                     'dog-running-on-beach',
                     'druid-ceremony',
                     'fabricated-antique',
                     'father-daughter-dance',
                     'left-behind',
                     'mink-coat',
                     'northeast-brazil',
                     'osage-tribe',
                     'policeman-costume',
                     'reference-to-heidi',
                     'saint-bernard-dog',
                     'saki',
                     'student-molestation',
                     'swim-team',
                     'vaginal-sex',
                     'wine-and-dine',
                     'wounded-to-death')),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('editor',
                   'miscellaneous crew')),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     OR gender IS NULL)
SELECT COUNT(*)
FROM title AS t
JOIN filtered_kt ON t.kind_id = filtered_kt.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN filtered_k ON mk.keyword_id = filtered_k.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_rt ON ci.role_id = filtered_rt.id
JOIN filtered_n ON ci.person_id = filtered_n.id
WHERE t.production_year BETWEEN 1950 AND 2010
  AND mi1.info_type_id IN ('5')
  AND mi1.info IN ('USA:X')
  AND mi2.info_type_id IN ('16')
  AND mi2.info IN ('USA:2003');