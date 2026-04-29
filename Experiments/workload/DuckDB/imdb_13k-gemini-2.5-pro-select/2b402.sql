WITH mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('anal-sex',
                     'based-on-novel',
                     'dancing',
                     'family-relationships',
                     'father-daughter-relationship',
                     'female-nudity',
                     'fight',
                     'gay',
                     'homosexual',
                     'hospital',
                     'husband-wife-relationship',
                     'interview',
                     'kidnapping',
                     'one-word-title',
                     'police',
                     'sex',
                     'singing',
                     'song',
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
WHERE t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('movie',
                   'video movie')
  AND it1.id IN ('5')
  AND mi1.info IN ('Argentina:Atp',
                    'Australia:G',
                    'Germany:16',
                    'Iceland:12',
                    'Norway:16',
                    'Portugal:M/12',
                    'Singapore:NC-16',
                    'Sweden:Btl',
                    'UK:15',
                    'USA:G',
                    'USA:TV-14')
  AND it2.id IN ('6')
  AND mi2.info IN ('Dolby Digital',
                    'Mono')
  AND rt.role IN ('producer')
  AND n.gender IN ('m');