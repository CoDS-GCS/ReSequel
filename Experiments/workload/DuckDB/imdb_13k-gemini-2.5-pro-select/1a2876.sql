
SELECT COUNT(*)
FROM title AS t,
     kind_type AS kt,
     info_type AS it1,
     movie_info AS mi1,
     movie_info AS mi2,
     info_type AS it2,
     cast_info AS ci,
     role_type AS rt,
     name AS n
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND mi1.info_type_id = it1.id
  AND mi2.info_type_id = it2.id
  AND it1.id IN ('18')
  AND it2.id IN ('105')
  AND t.kind_id = kt.id
  AND ci.person_id = n.id
  AND ci.role_id = rt.id
  AND mi1.info IN ('Berlin, Germany',
                    'Burbank, California, USA',
                    'Canada',
                    'London, England, UK',
                    'Manhattan, New York City, New York, USA',
                    'Melbourne, Victoria, Australia',
                    'Miami, Florida, USA',
                    'New York City, New York, USA',
                    'USA',
                    'Washington, District of Columbia, USA')
  AND mi2.info IN ('$10,000,000',
                    '$150,000',
                    '$2,000',
                    '$2,000,000',
                    '$250,000',
                    '$300,000',
                    '$35,000',
                    '$5,000,000',
                    '$50,000',
                    '$6,000,000',
                    '$60,000',
                    '$7,000,000',
                    '$75,000',
                    '$8,000',
                    '$80,000,000')
  AND kt.kind IN ('movie',
                   'tv movie',
                   'tv series',
                   'video game')
  AND rt.role IN ('actress',
                   'costume designer',
                   'director',
                   'editor',
                   'writer')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND t.production_year BETWEEN 1975 AND 2015;