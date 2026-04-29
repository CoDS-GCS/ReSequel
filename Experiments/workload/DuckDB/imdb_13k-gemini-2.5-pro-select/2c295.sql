
SELECT COUNT(*)
FROM title AS t
INNER JOIN kind_type AS kt ON t.kind_id = kt.id
INNER JOIN movie_info AS mi1 ON t.id = mi1.movie_id
INNER JOIN info_type AS it1 ON mi1.info_type_id = it1.id
INNER JOIN movie_info AS mi2 ON t.id = mi2.movie_id
INNER JOIN info_type AS it2 ON mi2.info_type_id = it2.id
INNER JOIN cast_info AS ci ON t.id = ci.movie_id
INNER JOIN name AS n ON ci.person_id = n.id
INNER JOIN role_type AS rt ON ci.role_id = rt.id
WHERE t.production_year BETWEEN 1925 AND 1975
  AND t.title IN ('(#1.0)',
                   '(#1.44)',
                   '(#2.28)',
                   '(#3.16)',
                   '(#6.10)',
                   'Aoi sanmyaku',
                   'Assignment in Brittany',
                   'Cinderella Jones',
                   'Der Vogelhändler',
                   'Handle with Care',
                   'Honky Tonk',
                   'Hostage',
                   'Law and Order',
                   'Noblesse Oblige',
                   'Rendezvous',
                   'Rich Man, Poor Man',
                   'Secret Agent X-9',
                   'Secrets',
                   'Stand Up and Cheer!',
                   'The Adventures of Huckleberry Finn',
                   'The Big Broadcast',
                   'The Breaking Point',
                   'The Green Pastures',
                   'The Lottery',
                   'The Promise',
                   'The Reluctant Dragon',
                   'The Roaring Twenties',
                   'White Eagle',
                   'Whom the Gods Destroy',
                   'Wo Du hin gehst...')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND it1.id IN ('5')
  AND mi1.info IN ('Australia:PG',
                    'Finland:K-18',
                    'France:-16',
                    'Germany:12',
                    'Netherlands:16',
                    'South Korea:All',
                    'USA:G')
  AND it2.id IN ('3')
  AND mi2.info IN ('Adventure',
                    'Animation',
                    'Biography',
                    'Crime',
                    'Documentary',
                    'Drama',
                    'Film-Noir',
                    'History',
                    'Music',
                    'Musical',
                    'Romance',
                    'Sport',
                    'War',
                    'Western')
  AND rt.role IN ('cinematographer',
                   'composer',
                   'guest',
                   'production designer',
                   'writer')
  AND (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL);