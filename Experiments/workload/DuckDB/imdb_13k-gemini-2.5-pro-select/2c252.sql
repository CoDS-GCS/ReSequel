
SELECT COUNT(*)
FROM movie_info AS mi1
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON mi1.movie_id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN title AS t ON mi1.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE mi1.info IN ('Action',
                    'Animation',
                    'Biography',
                    'Comedy',
                    'Crime',
                    'Documentary',
                    'Drama',
                    'Family',
                    'Film-Noir',
                    'Horror',
                    'Music',
                    'Romance',
                    'Sport',
                    'Thriller',
                    'War')
  AND it1.id IN ('3')
  AND mi2.info IN ('Argentina:Atp',
                    'Australia:PG',
                    'Finland:K-12',
                    'France:U',
                    'Germany:12',
                    'Netherlands:18',
                    'Netherlands:AL',
                    'Portugal:M/16',
                    'Sweden:Btl',
                    'UK:12',
                    'USA:G',
                    'USA:Not Rated')
  AND it2.id IN ('5')
  AND t.production_year BETWEEN 1950 AND 1990
  AND t.title IN ('(#1.294)',
                   '(#1.489)',
                   '(#1.5)',
                   '(#1.562)',
                   '(#1.711)',
                   '(#7.10)',
                   '1984 NFL Draft',
                   'Brookside',
                   'Double Your Pleasure',
                   'Kismet',
                   'Knightriders',
                   'Sleeping Beauty',
                   'The In Crowd')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND n.gender IN ('f',
                    'm')
  AND rt.role IN ('director',
                   'production designer');