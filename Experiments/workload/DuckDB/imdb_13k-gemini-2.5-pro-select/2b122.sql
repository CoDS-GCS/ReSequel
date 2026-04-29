WITH mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('black-ops',
                     'candle-stick',
                     'congressional-hearing',
                     'crawl-through-air-shaft',
                     'driving-in-a-thunderstorm',
                     'gypsum',
                     'impersonating-a-prostitute',
                     'klezmer-music',
                     'missile-test',
                     'movie-extra',
                     'nasty-face',
                     'pentagon',
                     'prayer-meeting',
                     'reference-to-allan-bloom',
                     'request',
                     'spoil-sport',
                     'suicide-of-boy',
                     'times-square'))
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
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND it1.id IN ('6')
  AND mi1.info IN ('DTS',
                    'Dolby Digital',
                    'Dolby',
                    'Mono',
                    'Silent',
                    'Stereo')
  AND it2.id IN ('4')
  AND mi2.info IN ('English',
                    'French',
                    'Japanese',
                    'Portuguese',
                    'Russian',
                    'Serbo-Croatian',
                    'Spanish')
  AND rt.role IN ('director')
  AND n.gender IN ('f');