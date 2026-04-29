 
 
SELECT COUNT(*)
FROM movie_info AS mi1
JOIN movie_info AS mi2 ON mi1.movie_id = mi2.movie_id
JOIN cast_info AS ci ON mi1.movie_id = ci.movie_id
JOIN title AS t ON mi1.movie_id = t.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE t.production_year BETWEEN 1925 AND 1975
  AND it1.id IN ('18')
  AND it2.id IN ('4')
  AND mi1.info IN ('Desilu Studios - 9336 W. Washington Blvd., Culver City, California, USA',
                    'General Service Studios - 1040 N. Las Palmas, Hollywood, Los Angeles, California, USA',
                    'Hal Roach Studios - 8822 Washington Blvd., Culver City, California, USA',
                    'Metro-Goldwyn-Mayer Studios - 10202 W. Washington Blvd., Culver City, California, USA',
                    'New York City, New York, USA',
                    'Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Republic Studios - 4024 Radford Avenue, North Hollywood, Los Angeles, California, USA',
                    'Revue Studios, Hollywood, Los Angeles, California, USA',
                    'Universal Studios - 100 Universal City Plaza, Universal City, California, USA',
                    'Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA')
  AND mi2.info IN ('English')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
  AND rt.role IN ('cinematographer')
  AND n.gender IS NULL;