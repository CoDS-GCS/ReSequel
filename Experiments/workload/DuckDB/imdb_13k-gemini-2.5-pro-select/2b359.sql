
SELECT COUNT(*)
FROM title AS t,
     movie_info AS mi1,
     movie_info AS mi2,
     cast_info AS ci,
     movie_keyword AS mk
WHERE t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.id = ci.movie_id
  AND t.id = mk.movie_id
  AND t.production_year BETWEEN 1975 AND 2015
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info IN ('CAM:Canon 7D',
                    'CAM:Canon XL-1',
                    'CAM:Panasonic AG-DVX100',
                    'CAM:Panasonic AG-HVX200',
                    'LAB:DeLuxe, Hollywood (CA), USA',
                    'OFM:HDCAM',
                    'OFM:Redcode RAW',
                    'OFM:Video',
                    'PCS:Betacam SP',
                    'PCS:DVCAM',
                    'PCS:HDCAM',
                    'PCS:Spherical',
                    'RAT:1.66 : 1',
                    'RAT:1.78 : 1',
                    'RAT:2.35 : 1')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie'))
  AND mi1.info_type_id IN ('2')
  AND mi2.info_type_id IN ('7')
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('acting-lesson',
                     'agricultural-cooperative',
                     'apollo',
                     'at-64-uss-navajo-tug',
                     'based-on-comic-book',
                     'centegenarian',
                     'eco',
                     'ending-taxation',
                     'genome',
                     'gyarados',
                     'island-city',
                     'kansas-state-university',
                     'key-maker',
                     'lipa',
                     'nhs',
                     'patiala-india',
                     'reference-to-john-wayne',
                     'referrence-to-royale-with-cheese',
                     'removing-intravenous-line',
                     'running-out-of-ammo',
                     'seven-point-police-badge',
                     'spiraling-eyes',
                     'stripping-wallpaper',
                     'three-friends'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('cinematographer',
                   'production designer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL);