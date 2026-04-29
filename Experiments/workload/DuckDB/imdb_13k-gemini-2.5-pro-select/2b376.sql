WITH mi1_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('2')
     AND mi.info IN ('Black and White',
                    'Color')),
     mi2_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('8')
     AND mi.info IN ('Bulgaria',
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
                    'Yugoslavia'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN mi1_filtered mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND rt.role IN ('director',
                   'editor')
  AND n.gender IN ('f',
                    'm')
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