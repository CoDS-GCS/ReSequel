WITH movies_with_info AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN movie_info AS mi2 ON mi1.movie_id = mi2.movie_id
   WHERE mi1.info_type_id = '3'
     AND mi1.info IN ('Action',
                   'Animation',
                   'Comedy',
                   'Crime',
                   'Family',
                   'Horror',
                   'Thriller')
     AND mi2.info_type_id = '5'
     AND mi2.info IN ('Canada:13+',
                   'Germany:12',
                   'Singapore:NC-16',
                   'South Korea:18',
                   'Switzerland:10',
                   'Switzerland:14',
                   'UK:U',
                   'USA:G',
                   'USA:Not Rated',
                   'USA:Unrated'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movies_with_info AS mwi ON t.id = mwi.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE t.production_year BETWEEN 1975 + 1 AND 2015
  AND kt.kind IN ('tv movie',
                  'tv series',
                  'video game')
  AND n.gender IN ('f')
  AND rt.role IN ('director');