 
 WITH cast_counts AS
  (SELECT ci.movie_id,
          count(*) AS num_casts
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   JOIN name AS n ON ci.person_id = n.id
   WHERE rt.role IN ('cinematographer',
                   'editor')
     AND (n.gender IN ('f')
          OR n.gender IS NULL)
   GROUP BY ci.movie_id),
     info_counts AS
  (SELECT movie_id,
          count(*) FILTER (
                           WHERE info_type_id IN ('4')
                             AND info IN ('Cantonese',
                    'Dutch',
                    'Finnish',
                    'German',
                    'Hebrew',
                    'Italian',
                    'Latin',
                    'Slovak',
                    'Spanish',
                    'Turkish')) AS num_info1,
          count(*) FILTER (
                           WHERE info_type_id IN ('7')
                             AND info IN ('LAB:Rank Film Laboratories, Denham, UK',
                    'OFM:35 mm',
                    'OFM:Video',
                    'PCS:Kinescope',
                    'PCS:Shawscope',
                    'PFM:16 mm',
                    'PFM:70 mm',
                    'RAT:1.37 : 1')) AS num_info2
   FROM movie_info
   GROUP BY movie_id)
SELECT SUM(cc.num_casts * ic.num_info1 * ic.num_info2)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_counts AS cc ON t.id = cc.movie_id
JOIN info_counts AS ic ON t.id = ic.movie_id
WHERE t.production_year BETWEEN 1950 AND 1990
  AND kt.kind IN ('episode',
                   'movie',
                   'video game')
  AND ic.num_info1 > 0
  AND ic.num_info2 > 0;