
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'video movie'))
  AND mi1.info_type_id IN ('4')
  AND mi1.info IN ('Dutch',
                    'English',
                    'French',
                    'Hindi',
                    'Italian',
                    'Japanese',
                    'Mandarin',
                    'Portuguese',
                    'Russian',
                    'Spanish',
                    'Swedish')
  AND mi2.info_type_id IN ('6')
  AND mi2.info IN ('Dolby Digital',
                    'Dolby SR',
                    'Dolby',
                    'Mono',
                    'Stereo',
                    'Ultra Stereo')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('cinematographer',
                   'costume designer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('bare-chested-male',
                     'cigarette-smoking',
                     'death',
                     'dog',
                     'father-daughter-relationship',
                     'love',
                     'non-fiction',
                     'nudity'));