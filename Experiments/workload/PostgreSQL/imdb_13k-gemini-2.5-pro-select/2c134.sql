WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND t.title IN ('(#1.135)',
                   '(#10.6)',
                   'A Clockwork Orange',
                   'Blood Feud',
                   'Colors',
                   'Ill Be Seeing You',
                   'Life and Death',
                   'O Lucky Man!',
                   'Rain Man',
                   'The Country Girl',
                   'The Wild One')
     AND kt.kind IN ('episode',
                   'movie',
                   'video game',
                   'video movie'))
SELECT COUNT(*)
FROM filtered_movies AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE n.gender IN ('f',
                    'm')
  AND rt.role IN ('cinematographer',
                   'composer',
                   'costume designer')
  AND it1.id IN ('7')
  AND mi1.info IN ('CAM:Panaflex Camera and Lenses by Panavision',
                    'LAB:Boyana Film Laboratory, Sofia, Bulgaria',
                    'LAB:DeLuxe, USA',
                    'LAB:Film Center, Mumbai, India',
                    'LAB:Metrocolor',
                    'OFM:16 mm',
                    'OFM:65 mm',
                    'PCS:(anamorphic)',
                    'PFM:Video',
                    'RAT:1.66 : 1')
  AND it2.id IN ('3')
  AND mi2.info IN ('Biography',
                    'Drama',
                    'Music',
                    'War',
                    'Western');