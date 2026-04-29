WITH valid_persons AS
  (SELECT n.id
   FROM name AS n
   JOIN person_info AS pi ON n.id = pi.person_id
   WHERE n.name ILIKE '%dohert%'
     AND pi.info_type_id IN ('28')),
     valid_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie'))
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
  AND mi1.info_type_id IN ('4',
                  '5')
  AND mi1.info IN ('Argentina:13',
                    'Australia:M',
                    'English',
                    'Netherlands:12',
                    'UK:15',
                    'USA:R',
                    'USA:TV-14',
                    'USA:TV-PG')
GROUP BY mi1.info,
         n.name;