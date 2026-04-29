
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t,
        kind_type AS kt,
        info_type AS it1,
        movie_info AS mi1,
        movie_info AS mi2,
        info_type AS it2,
        cast_info AS ci,
        role_type AS rt,
        name AS n
   WHERE t.id = ci.movie_id
     AND t.id = mi1.movie_id
     AND t.id = mi2.movie_id
     AND mi1.info_type_id = it1.id
     AND mi2.info_type_id = it2.id
     AND t.kind_id = kt.id
     AND ci.person_id = n.id
     AND ci.role_id = rt.id
     AND it1.id IN ('6')
     AND it2.id IN ('7')
     AND mi1.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'DTS-ES',
                    'DTS-Stereo',
                    'Datasat',
                    'Dolby Digital EX',
                    'Dolby Digital',
                    'Dolby Stereo',
                    'SDDS',
                    'Silent',
                    'Sonics-DDP',
                    'Ultra Stereo')
     AND mi2.info IN ('CAM:Arriflex Cameras',
                    'CAM:Panasonic AG-DVX100',
                    'LAB:FotoKem Laboratory, Burbank (CA), USA',
                    'PCS:Panavision',
                    'PFM:16 mm',
                    'PFM:Digital',
                    'RAT:1.66 : 1',
                    'RAT:1.78 : 1',
                    'RAT:16:9 HD')
     AND kt.kind IN ('movie',
                   'tv series',
                   'video movie')
     AND rt.role IN ('cinematographer',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer')
     AND n.gender IS NULL
     AND t.production_year BETWEEN 1975 AND 2015) AS subquery;