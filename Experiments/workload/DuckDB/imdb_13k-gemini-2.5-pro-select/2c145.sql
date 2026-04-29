WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND t.title IN ('(#1.91)',
                   '(#2.37)',
                   'As Pupilas do Senhor Reitor',
                   'Countdown',
                   'Erster Teil',
                   'Nora',
                   'Ordeal',
                   'Riffraff',
                   'Side Street',
                   'The Last Man',
                   'The Rivals',
                   'Too Many Cooks',
                   'Up the River',
                   'Vierter Teil')
     AND kt.kind IN ('episode',
                   'tv movie',
                   'tv series',
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
  AND rt.role IN ('director',
                   'editor',
                   'producer',
                   'production designer')
  AND it1.id IN ('7')
  AND mi1.info IN ('LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                    'LAB:DeLuxe',
                    'MET:',
                    'MET:15.2 m',
                    'MET:1500 m',
                    'MET:1800 m',
                    'OFM:35 mm',
                    'PCS:(anamorphic)',
                    'PCS:Shawscope',
                    'PCS:Techniscope',
                    'RAT:1.36 : 1')
  AND it2.id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color');