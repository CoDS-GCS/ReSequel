WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 1975
     AND t.title IN ('(#4.9)',
                   '(#5.6)',
                   '(#8.3)',
                   'A Double Life',
                   'Alice in Wonderland',
                   'Assassin',
                   'Black Gold',
                   'Carnival',
                   'Casino Royale',
                   'Catspaw',
                   'Cornered',
                   'Der müde Theodor',
                   'Giant',
                   'Jack the Ripper',
                   'Kidnapped',
                   'La dolce vita',
                   'Le bossu',
                   'Line of Fire',
                   'Man Hunt',
                   'Meet Me in Las Vegas',
                   'Midnight',
                   'Nous sommes tous des assassins',
                   'Sergeant York',
                   'Si Paris nous était conté',
                   'The Avengers',
                   'The Brothers',
                   'The Lost Weekend',
                   'The Man from Down Under',
                   'The Runaway')
     AND kt.kind IN ('episode',
                   'tv movie',
                   'tv series',
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
  AND rt.role IN ('actress',
                   'cinematographer',
                   'director',
                   'miscellaneous crew',
                   'production designer')
  AND it1.id IN ('7')
  AND mi1.info IN ('OFM:35 mm',
                    'PCS:Shawscope',
                    'PCS:Totalscope',
                    'PFM:Video',
                    'RAT:1.37 : 1')
  AND it2.id IN ('8')
  AND mi2.info IN ('Australia',
                    'Brazil',
                    'Denmark',
                    'Finland',
                    'France',
                    'Greece',
                    'Hong Kong',
                    'Hungary',
                    'India',
                    'Italy',
                    'Japan',
                    'Switzerland',
                    'UK',
                    'USA',
                    'Yugoslavia');