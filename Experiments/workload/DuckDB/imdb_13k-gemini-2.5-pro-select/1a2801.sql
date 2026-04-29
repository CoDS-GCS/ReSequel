
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('cinematographer',
                   'production designer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('105')
  AND mi1.info IN ('$20,000',
                    '$200,000',
                    '$300',
                    '$5,000',
                    '$50,000,000',
                    '$65,000,000',
                    '£5,000')
  AND mi2.info_type_id IN ('18')
  AND mi2.info IN ('Berlin, Germany',
                    'Las Vegas, Nevada, USA',
                    'Los Angeles, California, USA',
                    'Miami, Florida, USA',
                    'Rome, Lazio, Italy',
                    'Sydney, New South Wales, Australia',
                    'Vancouver, British Columbia, Canada');