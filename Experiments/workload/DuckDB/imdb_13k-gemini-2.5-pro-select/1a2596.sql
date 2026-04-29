
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv series',
                   'video game',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('director',
                   'production designer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f',
                    'm')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('7')
  AND mi1.info IN ('LAB:FotoKem Laboratory, Burbank (CA), USA',
                    'PCS:Panavision',
                    'PCS:Redcode RAW',
                    'PCS:Spherical',
                    'PFM:70 mm',
                    'PFM:Digital',
                    'PFM:Video',
                    'RAT:1.78 : 1 / (high definition)',
                    'RAT:1.78 : 1',
                    'RAT:1.85 : 1')
  AND mi2.info_type_id IN ('105')
  AND mi2.info IN ('$20,000',
                    '$25,000',
                    '$25,000,000',
                    '$40,000',
                    '$500',
                    '$6,000,000',
                    '$60,000,000',
                    '€ 10,000');