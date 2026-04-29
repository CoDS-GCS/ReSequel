
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'composer',
                   'miscellaneous crew',
                   'production designer',
                   'writer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('18')
  AND mi1.info IN ('15001 Calvert Street, Van Nuys, Los Angeles, California, USA',
                    'Atlanta, Georgia, USA',
                    'Beverly Hills, California, USA',
                    'Covington, Georgia, USA',
                    'Culver City, California, USA',
                    'Elstree Studios, Borehamwood, Hertfordshire, England, UK',
                    'Istanbul, Turkey',
                    'Jersey City, New Jersey, USA',
                    'Liverpool, Merseyside, England, UK',
                    'Long Island, New York, USA',
                    'Mumbai, Maharashtra, India',
                    'Munich, Bavaria, Germany',
                    'Nashville, Tennessee, USA',
                    'Old Royal Naval College, Greenwich, London, England, UK')
  AND mi2.info_type_id IN ('7')
  AND mi2.info IN ('CAM:Arricam LT, Cooke S4 and Angenieux Optimo Lenses',
                    'CAM:Arriflex 435, Panavision Primo Lenses',
                    'LAB:DeLuxe, USA',
                    'OFM:Redcode RAW',
                    'OFM:Super 16');