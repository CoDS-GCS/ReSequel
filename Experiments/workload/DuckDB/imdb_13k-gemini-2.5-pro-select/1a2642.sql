
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
                   'movie',
                   'tv movie',
                   'video game',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('composer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f',
                    'm')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('16')
  AND mi1.info IN ('Australia:1984',
                    'USA:1998',
                    'USA:2004',
                    'USA:2005',
                    'USA:2011',
                    'USA:2012',
                    'USA:2014',
                    'USA:April 2008',
                    'USA:August 2010',
                    'USA:June 2009',
                    'USA:June 2010',
                    'USA:May 2009')
  AND mi2.info_type_id IN ('8')
  AND mi2.info IN ('Bulgaria',
                    'Israel',
                    'Italy',
                    'Pakistan',
                    'Poland',
                    'Romania',
                    'Singapore',
                    'South Korea');