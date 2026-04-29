
SELECT COUNT(*)
FROM title AS t
INNER JOIN kind_type AS kt ON t.kind_id = kt.id
INNER JOIN movie_info AS mi1 ON t.id = mi1.movie_id
INNER JOIN info_type AS it1 ON mi1.info_type_id = it1.id
INNER JOIN movie_info AS mi2 ON t.id = mi2.movie_id
INNER JOIN info_type AS it2 ON mi2.info_type_id = it2.id
INNER JOIN cast_info AS ci ON t.id = ci.movie_id
INNER JOIN name AS n ON ci.person_id = n.id
INNER JOIN role_type AS rt ON ci.role_id = rt.id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND t.title IN ('(#1.92)',
                   '(#2.21)',
                   '(#4.24)',
                   'A Stitch in Time',
                   'A-Haunting We Will Go',
                   'Cavalleria rusticana',
                   'Das kalte Herz',
                   'Dirty Harry',
                   'Dixie',
                   'Follow the Sun',
                   'Honeymoon',
                   'I Dood It',
                   'I Take This Woman',
                   'Illegal Entry',
                   'Inside Job',
                   'Law and Disorder',
                   'M',
                   'Manhunt',
                   'Sergeant York',
                   'Target',
                   'Tennessee Johnson',
                   'The Baby',
                   'The Crystal Ball',
                   'The Grapes of Wrath',
                   'The Man Who Came to Dinner',
                   'The Sisters',
                   'The Undefeated',
                   'The Verdict',
                   'Time to Kill',
                   'Untamed',
                   'Vierter Teil')
  AND kt.kind IN ('episode',
                   'tv movie',
                   'tv series',
                   'video movie')
  AND it1.id IN ('7')
  AND mi1.info IN ('MET:100 m',
                    'MET:120 m',
                    'MET:150 m',
                    'MET:180 m',
                    'MET:300 m',
                    'MET:500 m',
                    'PCS:Kinescope',
                    'PCS:Panavision',
                    'PCS:Shawscope',
                    'PFM:35 mm',
                    'PFM:70 mm',
                    'RAT:1.36 : 1',
                    'RAT:1.37 : 1',
                    'RAT:1.85 : 1')
  AND it2.id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color')
  AND rt.role IN ('composer',
                   'editor',
                   'guest')
  AND (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL);