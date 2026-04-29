
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1990 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'video movie')) AS t_filtered
JOIN
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('6')
     AND mi.info IN ('DTS',
                    'Dolby Digital',
                    'Dolby SR',
                    'SDDS',
                    'Stereo')) AS mi1_filtered ON t_filtered.id = mi1_filtered.movie_id
JOIN
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('7')
     AND mi.info IN ('CAM:Panavision Cameras and Lenses',
                    'LAB:FotoKem Laboratory, Burbank (CA), USA',
                    'OFM:Video',
                    'PCS:DV',
                    'PCS:Digital Intermediate',
                    'PCS:Spherical',
                    'PFM:Video',
                    'RAT:1.85 : 1',
                    'RAT:2.35 : 1')) AS mi2_filtered ON t_filtered.id = mi2_filtered.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info ci
   JOIN role_type rt ON ci.role_id = rt.id
   JOIN name n ON ci.person_id = n.id
   WHERE rt.role IN ('composer',
                   'director')
     AND n.gender IN ('f')) AS ci_filtered ON t_filtered.id = ci_filtered.movie_id
JOIN
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('character-name-in-title',
                     'death',
                     'dog',
                     'family-relationships',
                     'female-frontal-nudity',
                     'female-nudity',
                     'gay',
                     'jealousy',
                     'love',
                     'male-nudity',
                     'marriage',
                     'number-in-title',
                     'police',
                     'sequel',
                     'suicide',
                     'surrealism')) AS mk_filtered ON t_filtered.id = mk_filtered.movie_id;