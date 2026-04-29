 
 WITH valid_titles AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')),
     valid_casts AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   JOIN name AS n ON ci.person_id = n.id
   WHERE rt.role IN ('director',
                   'editor',
                   'guest',
                   'producer')
     AND (n.gender IN ('f',
                    'm')
          OR n.gender IS NULL)),
     valid_movie_info1 AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   WHERE it1.id IN ('16')
     AND mi1.info IN ('Belgium:2011',
                    'Brazil:6 October 2011',
                    'Germany:10 February 2007',
                    'Germany:7 February 2008',
                    'USA:2010',
                    'USA:8 October 2010',
                    'USA:October 2006')),
     valid_movie_info2 AS
  (SELECT mi2.movie_id
   FROM movie_info AS mi2
   JOIN info_type AS it2 ON mi2.info_type_id = it2.id
   WHERE it2.id IN ('7')
     AND mi2.info IN ('CAM:Arricam LT, Zeiss Ultra Prime Lenses',
                    'CAM:Arriflex 435, Cooke S4 and Angenieux Optimo Lenses',
                    'CAM:Panavision Panaflex Platinum, Panavision Primo and C-Series Lenses',
                    'LAB:Cineworks Digital Studios, Miami (FL), USA',
                    'LAB:Monaco Film Laboratories, San Francisco (CA), USA',
                    'LAB:Synchro Film, Austria',
                    'MET:3150 m',
                    'OFM:Digital',
                    'RAT:4:3'))
SELECT COUNT(*)
FROM valid_titles AS t
JOIN valid_casts AS ci ON t.id = ci.movie_id
JOIN valid_movie_info1 AS mi1 ON t.id = mi1.movie_id
JOIN valid_movie_info2 AS mi2 ON t.id = mi2.movie_id;