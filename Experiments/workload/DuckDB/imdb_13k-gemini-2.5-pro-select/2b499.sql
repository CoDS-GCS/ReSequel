
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
  AND t.production_year BETWEEN 1925 AND 2015
  AND mi1.info IN ('Color')
  AND mi2.info IN ('CAM:Arri Alexa',
                    'CAM:Arriflex Cameras and Lenses',
                    'CAM:Panasonic AG-DVX100',
                    'LAB:DuArt Film Laboratories Inc., New York, USA',
                    'LAB:Technicolor, Hollywood (CA), USA',
                    'PCS:DVCAM',
                    'PCS:Shawscope',
                    'PFM:70 mm',
                    'PFM:Digital')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'video movie'))
  AND mi1.info_type_id IN ('2')
  AND mi2.info_type_id IN ('7')
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('barney-google',
                     'bowl-of-punch',
                     'cane-harvest',
                     'christian-compassion',
                     'destroying-a-computer',
                     'dog-muzzle',
                     'italian-filmmaking',
                     'lumberyard',
                     'male-corset',
                     'mystery-man',
                     'national-culture',
                     'pounding-chest',
                     'repossession',
                     'stock-cube',
                     'thalassophobia',
                     'unemployed',
                     'wild-card'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'composer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL);