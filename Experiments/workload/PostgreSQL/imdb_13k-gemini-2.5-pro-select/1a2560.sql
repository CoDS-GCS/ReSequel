 
 WITH filtered_titles AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'tv series',
                   'video game',
                   'video movie'))
SELECT COUNT(*)
FROM filtered_titles ft
JOIN cast_info AS ci ON ft.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_info AS mi1 ON ft.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON ft.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE rt.role IN ('actress',
                   'costume designer',
                   'guest',
                   'production designer')
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND it1.id IN ('105')
  AND mi1.info IN ('$11,000,000',
                    '$12,000',
                    '$14,000,000',
                    '$15,000,000',
                    '$150,000',
                    '$250,000',
                    '$300,000',
                    '$4,000',
                    '$4,000,000',
                    '$40,000,000',
                    '$6,000',
                    '$75,000,000',
                    '$8,000,000')
  AND it2.id IN ('7')
  AND mi2.info IN ('CAM:Panasonic AG-DVX100',
                    'LAB:DeLuxe, Hollywood (CA), USA',
                    'LAB:FotoKem Laboratory, Burbank (CA), USA',
                    'OFM:16 mm',
                    'OFM:35 mm',
                    'OFM:Super 16',
                    'OFM:Video',
                    'PCS:Digital Intermediate',
                    'PCS:Panavision',
                    'PCS:Spherical',
                    'PCS:Super 16',
                    'PFM:Video',
                    'RAT:1.37 : 1',
                    'RAT:1.66 : 1');