
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie'))
  AND mi1.info_type_id IN ('3')
  AND mi1.info IN ('Comedy',
                    'Documentary',
                    'Drama')
  AND mi2.info_type_id IN ('18')
  AND mi2.info IN ('Metro-Goldwyn-Mayer Studios - 10202 W. Washington Blvd., Culver City, California, USA',
                    'Mexico',
                    'New York City, New York, USA')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('costume designer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('bare-breasts',
                     'blood',
                     'homosexual',
                     'jealousy',
                     'lesbian',
                     'male-nudity',
                     'non-fiction',
                     'police'));