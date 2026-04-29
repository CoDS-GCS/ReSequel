WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 1975
     AND t.title IN ('(#1.17)',
                   '(#1.39)',
                   '(#1.77)',
                   '(#2.18)',
                   '(#2.34)',
                   '(#4.6)',
                   'All Star Comedy Carnival',
                   'Antigone',
                   'Assassin',
                   'Beatrice Cenci',
                   'Brief Encounter',
                   'Clash by Night',
                   'Cleopatra',
                   'Collectors Item',
                   'Collision Course',
                   'Das sündige Dorf',
                   'Der Bettelstudent',
                   'Gypsy',
                   'Hideout',
                   'Ill Tell the World',
                   'Im weißen Rößl',
                   'Its a Wonderful Life',
                   'Jennifer',
                   'Juha',
                   'Revenge',
                   'Sweet Charity',
                   'The Boss',
                   'The Cure',
                   'The Dream',
                   'The Grapes of Wrath',
                   'The Haunted House',
                   'The Hunted',
                   'The Princess',
                   'The Specialists',
                   'Time to Kill',
                   'Universal Newsreel',
                   'Urlaub auf Ehrenwort',
                   'Winner Take All',
                   'Wyoming')
     AND kt.kind IN ('episode',
                   'movie',
                   'video game',
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
  AND rt.role IN ('actor',
                   'composer',
                   'editor',
                   'miscellaneous crew')
  AND it1.id IN ('6')
  AND mi1.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'Mono',
                    'Silent',
                    'Stereo')
  AND it2.id IN ('3')
  AND mi2.info IN ('Adventure',
                    'Biography',
                    'Drama',
                    'History',
                    'Musical',
                    'Short',
                    'Western');