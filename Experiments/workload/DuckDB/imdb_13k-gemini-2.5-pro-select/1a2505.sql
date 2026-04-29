
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
                   'tv series',
                   'video game'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'actress',
                   'producer',
                   'production designer',
                   'writer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('4')
  AND mi1.info IN ('Czech',
                    'Dutch',
                    'English',
                    'Finnish',
                    'German',
                    'Italian',
                    'Korean',
                    'None',
                    'Serbian',
                    'Slovenian',
                    'Spanish',
                    'Swiss German',
                    'Turkish',
                    'Ukrainian',
                    'Urdu')
  AND mi2.info_type_id IN ('7')
  AND mi2.info IN ('CAM:Canon 5D Mark II',
                    'CAM:Panasonic AG-HVX200',
                    'LAB:FotoKem Laboratory, Burbank (CA), USA',
                    'LAB:Laboratoires Éclair, Paris, France',
                    'OFM:Super 16',
                    'PCS:(anamorphic)',
                    'PCS:DV',
                    'PCS:HDTV',
                    'PFM:D-Cinema',
                    'PFM:DVD-ROM',
                    'PFM:Video',
                    'RAT:1.66 : 1',
                    'RAT:2.35 : 1',
                    'RAT:4:3');