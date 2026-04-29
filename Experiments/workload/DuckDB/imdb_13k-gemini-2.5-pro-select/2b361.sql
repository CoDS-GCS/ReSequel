
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND mi1.info IN ('PFM:35 mm',
                    'RAT:2.35 : 1')
  AND mi2.info IN ('Finland:K-12',
                    'Iceland:L',
                    'UK:15')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'video movie'))
  AND mi1.info_type_id IN ('7')
  AND mi2.info_type_id IN ('5')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('miscellaneous crew',
                   'producer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IS NULL)
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('1860-census',
                     'axe-in-the-chest',
                     'burning-a-building',
                     'cape-hatteras-north-carolina',
                     'clothes-ripped-off',
                     'horse-drawn-snow-sled',
                     'lap-dance',
                     'lost-money',
                     'manchester-university',
                     'pre-nazi',
                     'rubber-dress'));