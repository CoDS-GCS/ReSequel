
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1990 AND 2015
     AND kt.kind IN ('tv series',
                   'video game')) AS t
JOIN
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('director')
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IN ('f')) AS ci ON t.id = ci.movie_id
JOIN
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   AND it1.id IN ('2')
   WHERE mi1.info IN ('Black and White',
                    'Color')) AS mi1 ON t.id = mi1.movie_id
JOIN
  (SELECT mi2.movie_id
   FROM movie_info AS mi2
   JOIN info_type AS it2 ON mi2.info_type_id = it2.id
   AND it2.id IN ('7')
   WHERE mi2.info IN ('CAM:Arri Alexa',
                    'CAM:Canon XL-1',
                    'CAM:Panasonic AG-DVX100',
                    'CAM:Panasonic AG-HVX200',
                    'LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                    'LAB:Technicolor',
                    'LAB:Technicolor, Hollywood (CA), USA',
                    'OFM:Redcode RAW',
                    'OFM:Video',
                    'PCS:Betacam SP',
                    'PCS:HDCAM',
                    'PCS:HDTV',
                    'PCS:Panavision',
                    'PFM:DVD-ROM',
                    'RAT:4:3 Letterbox')) AS mi2 ON t.id = mi2.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id;