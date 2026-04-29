
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('movie',
                   'tv movie',
                   'tv series',
                   'video game'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('cinematographer',
                   'guest'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('18')
  AND mi1.info IN ('Bradbury Building - 304 S. Broadway, Downtown, Los Angeles, California, USA',
                    'Brooklyn, New York City, New York, USA',
                    'China',
                    'Malibu, California, USA',
                    'Matera, Basilicata, Italy',
                    'New Westminster, British Columbia, Canada',
                    'Oahu, Hawaii, USA',
                    'Panama City, Panama',
                    'Philadelphia, Pennsylvania, USA',
                    'Providence, Rhode Island, USA',
                    'Sydney, New South Wales, Australia',
                    'Tribeca, Manhattan, New York City, New York, USA',
                    'Universal Studios Florida, Universal Orlando Resort - 1000 Universal Studios Plaza, Orlando, Florida, USA')
  AND mi2.info_type_id IN ('16')
  AND mi2.info IN ('Australia:14 October 2004',
                    'Canada:27 September 2005',
                    'France:16 November 2004',
                    'Hungary:10 April 2004',
                    'Norway:11 May 2004',
                    'Philippines:30 May 2003',
                    'Portugal:10 October 2005',
                    'USA:2003',
                    'USA:2007',
                    'USA:2008',
                    'USA:2009',
                    'USA:2011',
                    'USA:2014');