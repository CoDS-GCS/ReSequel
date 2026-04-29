
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'video movie'))
  AND mi1.info_type_id IN ('3')
  AND mi2.info_type_id IN ('7')
  AND mi1.info IN ('Comedy',
                    'Drama',
                    'Horror',
                    'Short')
  AND mi2.info IN ('OFM:16 mm',
                    'OFM:35 mm',
                    'RAT:1.33 : 1',
                    'RAT:1.78 : 1',
                    'RAT:1.85 : 1')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('producer',
                   'writer'))
  AND (n.gender IN ('f')
       OR n.gender IS NULL);