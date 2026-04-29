
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'tv movie',
                   'tv series',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'editor',
                   'guest',
                   'production designer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('105')
  AND mi1.info IN ('$1,000,000',
                    '$12,000',
                    '$200,000',
                    '$3,500,000',
                    '$30,000',
                    '$35,000',
                    '$350,000',
                    '$4,000',
                    '$60,000',
                    '$60,000,000',
                    '$70,000,000',
                    '$750,000',
                    '€ 3,000',
                    '€ 300,000')
  AND mi2.info_type_id IN ('18')
  AND mi2.info IN ('Atlanta, Georgia, USA',
                    'Austin, Texas, USA',
                    'Berlin, Germany',
                    'Las Vegas, Nevada, USA',
                    'London, England, UK',
                    'Miami, Florida, USA',
                    'Paris, France',
                    'Philadelphia, Pennsylvania, USA',
                    'Rome, Lazio, Italy',
                    'Toronto, Ontario, Canada',
                    'USA');