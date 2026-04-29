WITH filtered_titles AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1990 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'video game'))
SELECT COUNT(*)
FROM filtered_titles ft
JOIN cast_info AS ci ON ft.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_info AS mi1 ON ft.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON ft.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE rt.role IN ('composer',
                   'director',
                   'editor',
                   'guest')
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND it1.id IN ('7')
  AND mi1.info IN ('CAM:Canon 5D',
                    'CAM:Panasonic AG-DVX100',
                    'CAM:Red One Camera',
                    'LAB:EFILM Digital Laboratories, Hollywood (CA), USA',
                    'LAB:FotoKem Laboratory, Burbank (CA), USA',
                    'LAB:Laser Pacific Media Corporation, Los Angeles (CA), USA',
                    'LAB:Mandarin Laboratory (International) Ltd., Hong Kong',
                    'OFM:8 mm',
                    'OFM:Super 16',
                    'PCS:DVCAM',
                    'PCS:HDCAM',
                    'PCS:HDV',
                    'PFM:70 mm',
                    'RAT:1.85 : 1')
  AND it2.id IN ('4')
  AND mi2.info IN ('Cantonese',
                    'English',
                    'French',
                    'Hungarian',
                    'Italian',
                    'Persian',
                    'Serbian',
                    'Swiss German');