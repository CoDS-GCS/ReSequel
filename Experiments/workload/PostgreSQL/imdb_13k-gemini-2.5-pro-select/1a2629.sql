 
 WITH filtered_titles AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 1975
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
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
                   'cinematographer',
                   'miscellaneous crew',
                   'production designer',
                   'writer')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND it1.id IN ('18')
  AND mi1.info IN ('Hamburg, Germany',
                    'Los Angeles County Arboretum & Botanic Garden - 301 N. Baldwin Avenue, Arcadia, California, USA',
                    'MGM British Studios, Borehamwood, Hertfordshire, England, UK',
                    'Manhattan, New York City, New York, USA',
                    'Stage 17, Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Stage 19, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA')
  AND it2.id IN ('7')
  AND mi2.info IN ('LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                    'OFM:35 mm',
                    'PCS:CinemaScope',
                    'PCS:Kinescope',
                    'PCS:Techniscope',
                    'PFM:Video',
                    'RAT:4:3');