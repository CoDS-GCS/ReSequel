
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
WHERE t.production_year BETWEEN 1975 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND it1.id IN ('18')
  AND mi1.info IN ('Brooklyn, New York City, New York, USA',
                    'Canada',
                    'India',
                    'Long Beach, California, USA',
                    'Los Angeles, California, USA',
                    'Manhattan, New York City, New York, USA',
                    'New York City, New York, USA',
                    'Phoenix, Arizona, USA',
                    'San Diego, California, USA',
                    'Sydney, New South Wales, Australia')
  AND it2.id IN ('105')
  AND mi2.info IN ('$10,000',
                    '$12,000',
                    '$12,000,000',
                    '$18,000,000',
                    '$200',
                    '$30,000',
                    '$5,000',
                    '$80,000,000',
                    '€ 10,000',
                    '€ 5,000')
  AND rt.role IN ('actress',
                   'editor')
  AND (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL);