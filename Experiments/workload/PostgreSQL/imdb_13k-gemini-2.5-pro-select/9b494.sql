WITH filtered_movies AS
  (SELECT t.id,
          mi1.info
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND kt.kind IN ('episode',
                   'movie',
                   'tv series')
     AND mi1.info_type_id IN ('3',
                  '5')
     AND mi1.info IN ('Canada:G',
                    'Finland:K-12',
                    'History',
                    'Iceland:12',
                    'Iceland:16',
                    'Iceland:L',
                    'Sci-Fi',
                    'Singapore:PG',
                    'Spain:18',
                    'Sweden:11',
                    'UK:18',
                    'UK:X',
                    'USA:G',
                    'USA:PG',
                    'USA:X'))
SELECT fm.info,
       n.name,
       COUNT(*)
FROM name AS n
JOIN person_info AS pi ON n.id = pi.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN filtered_movies AS fm ON ci.movie_id = fm.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE n.name ILIKE '%ruc%'
  AND pi.info_type_id IN ('21')
  AND rt.role IN ('cinematographer',
                   'composer',
                   'editor',
                   'production designer')
GROUP BY fm.info,
         n.name;