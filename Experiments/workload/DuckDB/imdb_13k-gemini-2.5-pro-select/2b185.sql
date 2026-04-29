WITH t_filtered AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game'))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE mi1.info_type_id IN ('2')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info_type_id IN ('8')
  AND mi2.info IN ('Australia',
                    'Bulgaria',
                    'Estonia',
                    'France',
                    'Georgia',
                    'Iceland',
                    'Indonesia',
                    'Iran',
                    'Malaysia',
                    'South Africa',
                    'Thailand',
                    'UK')
  AND n.gender IN ('f',
                    'm')
  AND rt.role IN ('costume designer',
                   'writer')
  AND k.keyword IN ('based-on-novel',
                     'blood',
                     'death',
                     'father-daughter-relationship',
                     'fight',
                     'hospital',
                     'independent-film',
                     'interview',
                     'marriage',
                     'mother-daughter-relationship',
                     'number-in-title',
                     'one-word-title',
                     'revenge',
                     'song',
                     'suicide');