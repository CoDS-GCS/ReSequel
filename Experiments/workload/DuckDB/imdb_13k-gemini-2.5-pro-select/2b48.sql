WITH mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('-40-degrees-farenheit',
                     'black-family-resolution',
                     'car-hits-a-bicycle-rack',
                     'crop',
                     'entire-title-is-capitalized-acronym',
                     'first-responder',
                     'grail',
                     'horseshoe-crab',
                     'kralovice-czechoslovakia',
                     'larceny',
                     'literary',
                     'loose-tooth',
                     'military-convoy',
                     'miniature-effects',
                     'pocket-watch',
                     'putting-ones-head-in-an-oven-to-commit-suicide',
                     'reference-to-dartmouth-college',
                     'revolutionary-ideas',
                     'sleeps-with-eyes-open',
                     'tearing-down-a-brick-wall',
                     'tepoztlan'))
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
WHERE t.production_year BETWEEN 1975 AND 2015
  AND kt.kind IN ('episode',
                   'movie')
  AND it1.id IN ('6')
  AND mi1.info IN ('DTS',
                    'Dolby Digital',
                    'Dolby SR',
                    'Dolby',
                    'Mono',
                    'SDDS',
                    'Stereo')
  AND it2.id IN ('3')
  AND mi2.info IN ('Action',
                    'Animation',
                    'Biography',
                    'Crime',
                    'Family',
                    'Mystery',
                    'Reality-TV',
                    'Romance',
                    'Sci-Fi',
                    'Thriller')
  AND rt.role IN ('director')
  AND n.gender IN ('m');