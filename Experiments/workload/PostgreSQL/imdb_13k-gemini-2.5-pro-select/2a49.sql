 
 
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('episode',
                   'movie')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('f')
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('editor')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
AND it1.id IN ('4')
AND mi1.info IN ('Cantonese',
                    'English',
                    'French',
                    'Japanese',
                    'Portuguese',
                    'Spanish',
                    'Swedish')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
AND it2.id IN ('7')
AND mi2.info IN ('CAM:Panasonic AG-HVX200',
                    'OFM:Redcode RAW',
                    'PFM:35 mm',
                    'RAT:1.33 : 1',
                    'RAT:1.66 : 1',
                    'RAT:1.78 : 1',
                    'RAT:1.85 : 1',
                    'RAT:16:9 HD',
                    'RAT:2.35 : 1')
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1975 AND 2015;