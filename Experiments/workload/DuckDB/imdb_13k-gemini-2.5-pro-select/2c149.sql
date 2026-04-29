
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND t.title IN ('(#1.182)',
                   '(#1.416)',
                   '(#1.466)',
                   '(#1.529)',
                   '(#1.643)',
                   '(#1.722)',
                   '(#1.817)',
                   '(#10.4)',
                   '(#8.12)',
                   '(#9.4)',
                   '10',
                   'All Night Long',
                   'Caged',
                   'Caroline chérie',
                   'Don Carlos',
                   'Dracula',
                   'Dream Date',
                   'Finale',
                   'Heroes',
                   'Jane Eyre',
                   'Love on the Run',
                   'Money',
                   'Obsession',
                   'One Way Out',
                   'Outrage',
                   'Part 1',
                   'Salvage',
                   'Scoop',
                   'The 41st Annual Primetime Emmy Awards',
                   'The 58th Annual Academy Awards',
                   'The Betrayal',
                   'The Crossing',
                   'The Locket',
                   'Trial by Fire')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game')) AS t_filtered
JOIN cast_info AS ci ON t_filtered.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t_filtered.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t_filtered.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE n.gender IS NULL
  AND rt.role IN ('actress',
                   'costume designer',
                   'editor',
                   'miscellaneous crew',
                   'writer')
  AND it1.id IN ('6')
  AND mi1.info IN ('4-Track Stereo',
                    'Dolby',
                    'Mono',
                    'Silent',
                    'Stereo')
  AND it2.id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color');