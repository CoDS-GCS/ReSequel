
SELECT COUNT(*)
FROM
  (SELECT mk.movie_id
   FROM keyword AS k
   JOIN movie_keyword AS mk ON k.id = mk.keyword_id
   WHERE k.keyword IN ('burning-boat',
                     'chemical-structure',
                     'dharma',
                     'doctor-watson',
                     'emergency-medical-team',
                     'hot-night',
                     'leif-ericsson',
                     'mba',
                     'movie-investor',
                     'mute-slave',
                     'new-peoples-army',
                     'opal-mining',
                     'parisian-suburbs',
                     'psychological-ward',
                     'reference-to-dwight-d-eisenhower',
                     'reference-to-leo-sayer',
                     'rich-couple',
                     'social-outcast',
                     'socialist-realism',
                     'structural-stress',
                     'swimming-the-english-channel',
                     'tea-bowl',
                     'tunnel-boring-machine',
                     'turbulent',
                     'year-1775')) AS filtered_mk
JOIN title AS t ON filtered_mk.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('episode',
                   'video movie')
  AND it1.id IN ('6')
  AND mi1.info IN ('DTS',
                    'Dolby Digital',
                    'Dolby',
                    'SDDS',
                    'Silent',
                    'Stereo')
  AND it2.id IN ('3')
  AND mi2.info IN ('Action',
                    'Adult',
                    'Adventure',
                    'Biography',
                    'Crime',
                    'History',
                    'Music',
                    'Reality-TV',
                    'Sci-Fi',
                    'Short',
                    'Sport',
                    'Thriller',
                    'Western')
  AND rt.role IN ('composer',
                   'production designer')
  AND (n.gender IN ('m')
       OR n.gender IS NULL);