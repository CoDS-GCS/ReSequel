
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1925 AND 2015
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
     WHERE ROLE IN ('actress',
                   'costume designer',
                   'guest',
                   'production designer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('105')
  AND mi1.info IN ('$11,000,000',
                    '$12,000',
                    '$14,000,000',
                    '$15,000,000',
                    '$150,000',
                    '$250,000',
                    '$300,000',
                    '$4,000',
                    '$4,000,000',
                    '$40,000,000',
                    '$6,000',
                    '$75,000,000',
                    '$8,000,000')
  AND mi2.info_type_id IN ('7')
  AND mi2.info IN ('CAM:Panasonic AG-DVX100',
                    'LAB:DeLuxe, Hollywood (CA), USA',
                    'LAB:FotoKem Laboratory, Burbank (CA), USA',
                    'OFM:16 mm',
                    'OFM:35 mm',
                    'OFM:Super 16',
                    'OFM:Video',
                    'PCS:Digital Intermediate',
                    'PCS:Panavision',
                    'PCS:Spherical',
                    'PCS:Super 16',
                    'PFM:Video',
                    'RAT:1.37 : 1',
                    'RAT:1.66 : 1');