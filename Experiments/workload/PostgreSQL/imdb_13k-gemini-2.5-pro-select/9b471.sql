WITH valid_persons AS
  (SELECT n.id
   FROM name AS n
   JOIN person_info AS pi ON n.id = pi.person_id
   WHERE n.name ILIKE '%sale%'
     AND pi.info_type_id IN ('29')),
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
  AND mi1.info_type_id IN ('3',
                  '4',
                  '5')
  AND mi1.info IN ('Animation',
                    'Argentina:Atp',
                    'Biography',
                    'Finland:K-11',
                    'France:-12',
                    'Hindi',
                    'Malaysia:U',
                    'Musical',
                    'New Zealand:M',
                    'Norway:15',
                    'Singapore:M18',
                    'South Korea:12',
                    'Spain:18',
                    'Sweden:11',
                    'Sweden:7',
                    'Switzerland:12',
                    'Switzerland:7',
                    'UK:PG')
GROUP BY mi1.info,
         n.name;