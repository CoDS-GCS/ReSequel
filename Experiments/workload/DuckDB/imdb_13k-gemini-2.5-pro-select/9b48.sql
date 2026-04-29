WITH valid_persons AS
  (SELECT n.id
   FROM name AS n
   JOIN person_info AS pi ON n.id = pi.person_id
   WHERE n.name ILIKE '%bl%'
     AND pi.info_type_id IN ('19')),
     valid_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 1975
     AND kt.kind IN ('tv movie',
                   'video game',
                   'video movie'))
SELECT mi1.info,
       n.name,
       COUNT(*)
FROM cast_info AS ci
JOIN name AS n ON ci.person_id = n.id
JOIN movie_info AS mi1 ON ci.movie_id = mi1.movie_id
WHERE ci.person_id IN
    (SELECT id
     FROM valid_persons)
  AND ci.movie_id IN
    (SELECT id
     FROM valid_movies)
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'director',
                   'miscellaneous crew',
                   'producer'))
  AND mi1.info_type_id IN ('3',
                  '4',
                  '5')
  AND mi1.info IN ('Belgium:KT',
                    'Dutch',
                    'Musical',
                    'Short',
                    'Sport',
                    'Swedish')
GROUP BY mi1.info,
         n.name;