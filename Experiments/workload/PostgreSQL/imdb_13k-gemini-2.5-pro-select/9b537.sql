WITH valid_persons AS
  (SELECT n.id
   FROM name AS n
   JOIN person_info AS pi ON n.id = pi.person_id
   WHERE n.name ILIKE '%figue%'
     AND pi.info_type_id IN ('24')),
     valid_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 2015
     AND kt.kind IN ('tv series',
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
     WHERE ROLE IN ('actor',
                   'actress',
                   'cinematographer',
                   'composer',
                   'costume designer'))
  AND mi1.info_type_id IN ('2',
                  '4',
                  '8')
  AND mi1.info IN ('Color',
                    'Portuguese',
                    'USA')
GROUP BY mi1.info,
         n.name;