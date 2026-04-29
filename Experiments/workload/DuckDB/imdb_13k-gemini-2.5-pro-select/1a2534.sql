
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
WHERE t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'video game',
                   'video movie')
  AND it1.id IN ('105')
  AND mi1.info IN ('$10,000,000',
                    '$100',
                    '$150,000',
                    '$25,000,000',
                    '$3,000',
                    '$3,500',
                    '$50,000',
                    '$500',
                    '$6,000,000',
                    '$75,000',
                    '$8,000',
                    '£5,000',
                    '€ 15,000',
                    '€ 5,000',
                    '€ 50,000')
  AND it2.id IN ('8')
  AND mi2.info IN ('Greece',
                    'India',
                    'Italy',
                    'Spain',
                    'Sweden',
                    'USA')
  AND rt.role IN ('actress',
                   'director',
                   'producer')
  AND (n.gender IN ('f')
       OR n.gender IS NULL);