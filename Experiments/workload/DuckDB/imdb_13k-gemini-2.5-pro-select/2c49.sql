WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 1975
     AND t.title IN ('(#1.91)',
                   '(#6.13)',
                   '(#7.14)',
                   'Dobrý voják Svejk',
                   'Fear',
                   'Juha',
                   'Show Business',
                   'Something to Live For',
                   'The Grapes of Wrath',
                   'The Red Badge of Courage',
                   'The Showdown')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video movie'))
SELECT COUNT(*)
FROM filtered_movies AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE n.gender IN ('f',
                    'm')
  AND rt.role IN ('cinematographer',
                   'composer',
                   'writer')
  AND it1.id IN ('6')
  AND mi1.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'Mono',
                    'Silent',
                    'Stereo')
  AND it2.id IN ('1')
  AND mi2.info IN ('20',
                    '25',
                    '60',
                    '65',
                    '73',
                    '75',
                    '81',
                    '87',
                    '89',
                    '9',
                    '95',
                    'USA:30',
                    'USA:60');