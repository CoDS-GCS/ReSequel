
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
                   'tv series',
                   'video game',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('editor'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('3')
  AND mi1.info IN ('Action',
                    'Biography',
                    'Family',
                    'Mystery',
                    'News',
                    'Sci-Fi',
                    'Thriller',
                    'Western')
  AND mi2.info_type_id IN ('7')
  AND mi2.info IN ('CAM:Canon XL-1',
                    'CAM:Canon XL-2',
                    'LAB:Tokyo Laboratory Ltd., Tokyo, Japan',
                    'OFM:Digital',
                    'PCS:Digital Intermediate',
                    'PFM:70 mm');