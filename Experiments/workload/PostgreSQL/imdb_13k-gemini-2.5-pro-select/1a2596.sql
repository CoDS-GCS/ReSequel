 
 
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND kt.kind IN ('tv series',
                   'video game',
                   'video movie')
  AND it1.id IN ('7')
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
  AND it2.id IN ('105')
  AND mi2.info IN ('$20,000',
                    '$25,000',
                    '$25,000,000',
                    '$40,000',
                    '$500',
                    '$6,000,000',
                    '$60,000,000',
                    '€ 10,000')
  AND rt.role IN ('director',
                   'production designer')
  AND (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL);