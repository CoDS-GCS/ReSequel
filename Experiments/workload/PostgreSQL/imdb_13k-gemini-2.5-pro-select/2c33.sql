WITH t_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 1975
     AND t.title IN ('(#1.123)',
                   '(#1.78)',
                   '(#2.36)',
                   '(#8.10)',
                   'A Matter of Honor',
                   'All Star Comedy Carnival',
                   'Austerlitz',
                   'Born to Sing',
                   'Down on the Farm',
                   'Gilda',
                   'Giuseppe Verdi',
                   'Justice',
                   'Knock on Any Door',
                   'Million Dollar Mermaid',
                   'Money to Burn',
                   'Never a Dull Moment',
                   'Pack Up Your Troubles',
                   'Second Chance',
                   'Seven Sinners',
                   'Skin Deep',
                   'Some Like It Hot',
                   'South Pacific',
                   'Storm Warning',
                   'The Day the Earth Stood Still',
                   'The Gangs All Here',
                   'The Intruder',
                   'The Lemon Drop Kid',
                   'The Lone Ranger Rides Again',
                   'The Matchmakers',
                   'The Ten Commandments',
                   'The Visitors',
                   'The Winner',
                   'Unser Sandmännchen',
                   'When We Are Married')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'video game',
                   'video movie'))
SELECT COUNT(*)
FROM t_filtered
JOIN cast_info AS ci ON t_filtered.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t_filtered.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t_filtered.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE n.gender IS NULL
  AND rt.role IN ('actor',
                   'composer',
                   'producer',
                   'writer')
  AND it1.id IN ('2')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND it2.id IN ('5')
  AND mi2.info IN ('Argentina:13',
                    'Argentina:16',
                    'Finland:S',
                    'Germany:12',
                    'Iceland:16',
                    'Sweden:11',
                    'Sweden:Btl',
                    'UK:15',
                    'UK:PG',
                    'UK:U',
                    'USA:Approved',
                    'USA:G',
                    'USA:R',
                    'USA:TV-PG',
                    'West Germany:6');