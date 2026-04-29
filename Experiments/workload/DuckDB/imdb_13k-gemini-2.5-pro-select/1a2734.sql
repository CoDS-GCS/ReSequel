
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
                   'video game',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('director',
                   'guest'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('4')
  AND mi1.info IN ('Bengali',
                    'Croatian',
                    'Dutch',
                    'English',
                    'Estonian',
                    'Filipino',
                    'Hindi',
                    'Japanese',
                    'Korean',
                    'Polish',
                    'Portuguese',
                    'Spanish')
  AND mi2.info_type_id IN ('7')
  AND mi2.info IN ('LAB:Kinuta Laboratories, Tokyo, Japan',
                    'LAB:Laboratoires Éclair, Paris, France',
                    'OFM:Redcode RAW',
                    'RAT:4:3 Letterbox',
                    'RAT:4:3');