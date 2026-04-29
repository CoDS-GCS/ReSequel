
SELECT COUNT(*)
FROM
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 2015
     AND title IN ('(#1.768)',
                   '(2006-10-28)',
                   'Coup de théâtre',
                   'Face-Off',
                   'Felix',
                   'Harvest',
                   'Indiana Jones and the Kingdom of the Crystal Skull',
                   'Marina',
                   'Mirrors',
                   'One Man Band',
                   'Sesshoku',
                   'Shattered Image',
                   'Street Gun',
                   'The British Invasion',
                   'The Missing Piece',
                   'The Zone')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'video game',
                   'video movie'))) AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN
  (SELECT id
   FROM name
   WHERE gender IS NULL) AS n ON ci.person_id = n.id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actress',
                   'composer',
                   'editor',
                   'miscellaneous crew',
                   'writer')) AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('7')
  AND mi1.info IN ('CAM:Arricam LT',
                    'LAB:Fotofilm S.A., Madrid, Spain',
                    'LAB:Rank Film Laboratories, Denham, UK',
                    'LAB:Technicolor, London, UK',
                    'PCS:Digital Intermediate',
                    'RAT:4:3')
  AND mi2.info_type_id IN ('8')
  AND mi2.info IN ('Argentina',
                    'Brazil',
                    'Chile',
                    'Denmark',
                    'Ireland',
                    'Japan',
                    'Luxembourg',
                    'Netherlands',
                    'Singapore',
                    'Slovenia',
                    'Thailand',
                    'USA');