
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
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('producer',
                   'production designer',
                   'writer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('3')
  AND mi1.info IN ('Adult',
                    'Family',
                    'Horror',
                    'Music',
                    'News',
                    'Sport',
                    'War',
                    'Western')
  AND mi2.info_type_id IN ('7')
  AND mi2.info IN ('CAM:Arriflex Cameras and Lenses',
                    'CAM:Canon XH-A1',
                    'CAM:Panavision Camera and Lenses',
                    'CAM:Red One Camera',
                    'LAB:EFILM Digital Laboratories, Hollywood (CA), USA',
                    'LAB:FotoKem Laboratory, Burbank (CA), USA',
                    'LAB:Rank Film Laboratories, Denham, UK',
                    'OFM:65 mm',
                    'PCS:Digital Video',
                    'PCS:HDV',
                    'PCS:Redcode RAW',
                    'PFM:CD-ROM',
                    'PFM:Video',
                    'RAT:1.37 : 1',
                    'RAT:1.66 : 1');