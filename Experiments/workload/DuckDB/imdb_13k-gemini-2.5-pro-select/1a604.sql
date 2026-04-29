
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year <= 2015
  AND t.production_year > 1990
  AND kt.kind IN ('episode',
                  'movie',
                  'video movie')
  AND mi1.info_type_id = '3'
  AND mi1.info IN ('Adventure',
                   'Comedy',
                   'Crime',
                   'Documentary',
                   'Drama',
                   'Family',
                   'Sci-Fi',
                   'Thriller')
  AND mi2.info_type_id = '5'
  AND mi2.info IN ('Argentina:13',
                   'Australia:PG',
                   'Finland:K-11',
                   'Germany:o.Al.',
                   'Iceland:16',
                   'Italy:T',
                   'Netherlands:AL',
                   'South Korea:15',
                   'Spain:13',
                   'Sweden:11',
                   'UK:15',
                   'USA:Unrated')
  AND rt.role IN ('cinematographer',
                  'director')
  AND n.gender IN ('f');