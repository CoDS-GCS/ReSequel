
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
                   'movie',
                   'tv movie',
                   'tv series'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'director',
                   'editor',
                   'guest',
                   'producer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('16')
  AND mi1.info IN ('Canada:11 September 2004',
                    'France:17 May 2007',
                    'Germany:10 February 2007',
                    'Iceland:8 April 2005',
                    'USA:16 April 2010',
                    'USA:2008',
                    'USA:28 October 2005',
                    'USA:April 2008')
  AND mi2.info_type_id IN ('5')
  AND mi2.info IN ('Argentina:16',
                    'Brazil:16',
                    'Canada:13+',
                    'Canada:14+',
                    'Canada:A',
                    'Canada:F',
                    'Iceland:L',
                    'Italy:VM14',
                    'Netherlands:12',
                    'Portugal:M/6',
                    'South Africa:13V',
                    'South Korea:All',
                    'Sweden:Btl',
                    'Taiwan:R-12',
                    'UK:PG');