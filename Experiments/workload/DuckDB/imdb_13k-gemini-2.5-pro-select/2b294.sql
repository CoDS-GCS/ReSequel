WITH mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('bajo-fondo-tango-club',
                     'brady-bunch-spoof',
                     'burn-blister',
                     'cat-worshipper',
                     'child-translates-for-adult',
                     'church-mouse',
                     'combine-the-machine',
                     'command-of-the-sea',
                     'dancing-on-a-coffin',
                     'frog-toy',
                     'glass-bottomed-limousine',
                     'kew-gardens-london',
                     'legal-issue',
                     'new-age-music',
                     'nude-statue',
                     'parallel-economy',
                     'photography-studio',
                     'public-strike',
                     'reference-to-cliff-huxtable',
                     'residence-meeting',
                     'south-ossetia',
                     'swimming-coach',
                     'torso-slashed-open'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN mk_filtered AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND kt.kind IN ('movie',
                   'tv movie')
  AND it1.id IN ('5')
  AND mi1.info IN ('Australia:G',
                    'Belgium:KT',
                    'Finland:K-16',
                    'Finland:S',
                    'India:U',
                    'Sweden:15',
                    'UK:A',
                    'UK:PG',
                    'UK:U',
                    'USA:Passed',
                    'USA:X')
  AND it2.id IN ('8')
  AND mi2.info IN ('Belgium',
                    'France',
                    'India',
                    'Italy',
                    'UK',
                    'USA')
  AND rt.role IN ('actor',
                   'actress')
  AND n.gender IN ('f',
                    'm');