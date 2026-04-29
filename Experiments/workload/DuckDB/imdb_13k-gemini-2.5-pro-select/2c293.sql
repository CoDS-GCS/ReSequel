WITH movie_ids AS (
                     (SELECT movie_id
                      FROM movie_info
                      WHERE info_type_id IN ('2')
                        AND info IN ('Black and White',
                    'Color')) INTERSECT
                     (SELECT movie_id
                      FROM movie_info
                      WHERE info_type_id IN ('6')
                        AND info IN ('DTS',
                    'Dolby SR',
                    'Dolby',
                    'Mono',
                    'Ultra Stereo')))
SELECT COUNT(*)
FROM title AS t
JOIN movie_ids mi ON t.id = mi.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN kind_type AS kt ON t.kind_id = kt.id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND t.title IN ('(#1.3662)',
                   '(#1.601)',
                   '(#22.12)',
                   '(#5.139)',
                   '(2001-03-18)',
                   '(2001-04-14)',
                   '(2005-06-18)',
                   '(2007-03-07)',
                   '(2008-08-04)',
                   '(2010-05-03)',
                   '(2012-06-12)',
                   'After Sex',
                   'Bad Girl',
                   'Bala at lipistik',
                   'Boricua',
                   'Comedy Central Roast of Roseanne',
                   'Conversion',
                   'Die Wahrheit',
                   'Dirty Little Secrets',
                   'Double Trouble with Guest Housemates David and Anthony',
                   'Down the Rabbit Hole',
                   'Gia',
                   'Hanyo',
                   'His & Hers',
                   'I Never Looked So Foolish in My Whole Entire Life: Outback',
                   'La vendedora de rosas',
                   'Leaving Normal',
                   'Marci X',
                   'Meet the Robinsons',
                   'Never Been Kissed',
                   'Princess',
                   'Rabbids Go Home',
                   'Round 10',
                   'Suck It',
                   'The 63rd Primetime Emmy Awards',
                   'The Disappearance of Garcia Lorca',
                   'The Kidney Stays in the Picture',
                   'The Stand-In',
                   'There Is No Place Like Home',
                   'Thunder in Paradise',
                   'Yours, Mine and Ours')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND rt.role IN ('cinematographer',
                   'composer',
                   'costume designer',
                   'guest',
                   'production designer')
  AND (n.gender IN ('m')
       OR n.gender IS NULL);