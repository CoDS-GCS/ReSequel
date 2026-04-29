WITH filtered_mi1 AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   WHERE mi1.info_type_id IN ('8')
     AND mi1.info IN ('Australia',
                    'Finland',
                    'Georgia',
                    'Germany',
                    'Norway',
                    'Peru',
                    'Serbia',
                    'South Africa',
                    'Spain',
                    'Switzerland',
                    'Taiwan',
                    'UK',
                    'United Arab Emirates',
                    'West Germany')),
     filtered_mi2 AS
  (SELECT mi2.movie_id
   FROM movie_info AS mi2
   WHERE mi2.info_type_id IN ('7')
     AND mi2.info IN ('CAM:Canon 5D Mark II',
                    'CAM:Panavision Cameras and Lenses',
                    'CAM:Panavision Panaflex Platinum, Panavision Primo Lenses',
                    'LAB:DeLuxe',
                    'MET:300 m',
                    'MET:600 m',
                    'OFM:16 mm',
                    'PCS:HDCAM',
                    'PCS:HDV',
                    'PCS:Shawscope',
                    'PCS:Super 16',
                    'PFM:16 mm',
                    'RAT:1.66 : 1',
                    'RAT:1.85 : 1',
                    'RAT:2.20 : 1'))
SELECT COUNT(*)
FROM title AS t
JOIN filtered_mi1 ON t.id = filtered_mi1.movie_id
JOIN filtered_mi2 ON t.id = filtered_mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN kind_type AS kt ON t.kind_id = kt.id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND t.title IN ('(#1.177)',
                   '(#1.9328)',
                   '(#10.3)',
                   '(#15.47)',
                   '(#2.98)',
                   '(#8.72)',
                   '(1995-05-24)',
                   '(1999-06-09)',
                   '(2002-07-04)',
                   '(2006-07-17)',
                   '(2007-05-05)',
                   '(2009-09-29)',
                   '(2010-02-09)',
                   '(2010-03-20)',
                   '...And a Vintage Warplane',
                   'Anna',
                   'Dr. Dolittle 2',
                   'Hired Wife',
                   'Hooked',
                   'Ill Do Anything',
                   'Killing Them Softly',
                   'Lifes a Beach',
                   'Live Results Show: One Contestant Eliminated',
                   'Maging sino ka man',
                   'Magnet',
                   'Mission: Impossible',
                   'Moving Pictures',
                   'No Other Love',
                   'Of All the Things',
                   'One Day in the Valley',
                   'One Last Thing...',
                   'Primicias',
                   'Russian Roulette',
                   'Shin sangoku musô 5',
                   'Snow Angels',
                   'The Dilemma',
                   'The More Things Change',
                   'To Have and to Hold',
                   'Tori Tortures Teacher',
                   'When the Levee Breaks')
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND rt.role IN ('cinematographer',
                   'director',
                   'guest')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie');