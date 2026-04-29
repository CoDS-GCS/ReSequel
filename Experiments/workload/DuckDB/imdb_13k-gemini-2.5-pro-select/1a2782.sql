
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1925 AND 1975
  AND kt.kind IN ('episode',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND it1.id IN ('5')
  AND mi1.info IN ('Australia:G',
                    'Brazil:12',
                    'Canada:PG',
                    'Italy:VM18',
                    'Japan:G',
                    'Netherlands:16',
                    'Singapore:NC-16',
                    'South Korea:18')
  AND it2.id IN ('18')
  AND mi2.info IN ('California, USA',
                    'Cinecittà Studios, Cinecittà, Rome, Lazio, Italy',
                    'Desilu Studios - 9336 W. Washington Blvd., Culver City, California, USA',
                    'Hawaii, USA',
                    'Munich, Bavaria, Germany',
                    'Shepperton Studios, Shepperton, Surrey, England, UK',
                    'Universal Studios - 100 Universal City Plaza, Universal City, California, USA')
  AND rt.role IN ('cinematographer',
                   'guest',
                   'producer')
  AND (n.gender IN ('m')
       OR n.gender IS NULL);