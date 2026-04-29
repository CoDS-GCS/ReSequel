WITH mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('cigarette-smoking',
                     'death',
                     'father-son-relationship',
                     'female-nudity',
                     'flashback',
                     'gay',
                     'gun',
                     'kidnapping',
                     'lesbian',
                     'male-nudity',
                     'mother-daughter-relationship',
                     'murder',
                     'new-york-city',
                     'nudity',
                     'number-in-title',
                     'one-word-title',
                     'oral-sex',
                     'sequel',
                     'singing',
                     'violence'))
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
WHERE t.production_year BETWEEN 1950 AND 2010
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND it1.id IN ('5')
  AND mi1.info IN ('Australia:M',
                    'Finland:K-18',
                    'Germany:12',
                    'Germany:18',
                    'Iceland:12',
                    'Iceland:L',
                    'Netherlands:6',
                    'Norway:15',
                    'Spain:T',
                    'Sweden:11',
                    'Sweden:Btl',
                    'UK:12')
  AND it2.id IN ('4')
  AND mi2.info IN ('English',
                    'German')
  AND rt.role IN ('miscellaneous crew',
                   'producer')
  AND n.gender IN ('f',
                    'm');