WITH mi1_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('4')
     AND mi.info IN ('Dutch',
                    'English',
                    'French',
                    'Hindi',
                    'Italian',
                    'Japanese',
                    'Mandarin',
                    'Portuguese',
                    'Russian',
                    'Spanish',
                    'Swedish')),
     mi2_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('6')
     AND mi.info IN ('Dolby Digital',
                    'Dolby SR',
                    'Dolby',
                    'Mono',
                    'Stereo',
                    'Ultra Stereo'))
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
WHERE t.production_year BETWEEN 1990 AND 2015
  AND kt.kind IN ('episode',
                   'video movie')
  AND rt.role IN ('cinematographer',
                   'costume designer')
  AND n.gender IN ('m')
  AND k.keyword IN ('bare-chested-male',
                     'cigarette-smoking',
                     'death',
                     'dog',
                     'father-daughter-relationship',
                     'love',
                     'non-fiction',
                     'nudity');