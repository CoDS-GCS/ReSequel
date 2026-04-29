WITH t_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 2010
     AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game'))
SELECT COUNT(*)
FROM t_filtered
JOIN movie_info AS mi1 ON t_filtered.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t_filtered.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t_filtered.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t_filtered.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE it1.id IN ('7')
  AND mi1.info IN ('CAM:Arriflex Cameras and Lenses',
                    'CAM:Panasonic AG-DVX100',
                    'CAM:Panavision Cameras and Lenses',
                    'CAM:Red One Camera',
                    'LAB:FotoKem Laboratory, Burbank (CA), USA',
                    'OFM:16 mm',
                    'OFM:35 mm',
                    'PCS:Digital Intermediate',
                    'PCS:Super 35',
                    'PFM:Video',
                    'RAT:1.33 : 1',
                    'RAT:1.37 : 1')
  AND it2.id IN ('3')
  AND mi2.info IN ('Action',
                    'Adult',
                    'Comedy',
                    'Crime',
                    'Documentary',
                    'Drama',
                    'Romance',
                    'Sci-Fi',
                    'Short',
                    'Sport',
                    'Thriller')
  AND rt.role IN ('production designer')
  AND n.gender IS NULL
  AND k.keyword IN ('doctor',
                     'family-relationships',
                     'female-frontal-nudity',
                     'female-nudity',
                     'flashback',
                     'gay',
                     'hardcore',
                     'homosexual',
                     'jealousy',
                     'kidnapping',
                     'male-frontal-nudity',
                     'mother-daughter-relationship',
                     'new-york-city',
                     'party',
                     'sequel',
                     'sex',
                     'suicide');