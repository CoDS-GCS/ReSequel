WITH t_filtered AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'video movie'))
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
  AND mi2.info IN ('Bulgaria',
                    'Colombia',
                    'Croatia',
                    'Egypt',
                    'Federal Republic of Yugoslavia',
                    'Italy',
                    'Malaysia',
                    'New Zealand',
                    'Romania',
                    'South Africa',
                    'Spain',
                    'Thailand',
                    'UK',
                    'West Germany',
                    'Yugoslavia')
  AND n.gender IN ('f',
                    'm')
  AND rt.role IN ('director',
                   'editor')
  AND k.keyword IN ('cannes',
                     'cereal-treat',
                     'cone-of-silence',
                     'framed-for-a-crime',
                     'heparin',
                     'illegal-fundraising',
                     'lizards-used-as-dinosaurs',
                     'political-influence',
                     'traditional-clothing',
                     'underwater-explosive-device',
                     'videoclip-compilation');