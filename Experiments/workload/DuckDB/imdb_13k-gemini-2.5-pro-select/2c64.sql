WITH t_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND t.title IN ('(#1.10012)',
                   '(#1.1622)',
                   '(#1.5567)',
                   '(#1.773)',
                   '(#5.91)',
                   '(2000-06-28)',
                   '(2001-03-25)',
                   '(2004-09-07)',
                   '(2004-12-04)',
                   '(2006-05-04)',
                   '(2007-03-09)',
                   '(2007-05-13)',
                   '(2011-02-24)',
                   'A Real Dilemma',
                   'And God Created Woman',
                   'Besieged',
                   'Bill & Teds Excellent Adventure',
                   'Cleaning House',
                   'Crackerjack',
                   'Death at a Funeral',
                   'Fade Out',
                   'Fantastic Mr. Fox',
                   'Grim',
                   'Guess Whos Not Coming to Dinner',
                   'Ill Be Seeing You',
                   'Interstate 60: Episodes of the Road',
                   'Lessons',
                   'MTV Video Music Awards 2011',
                   'Moses und Aron',
                   'Siberia',
                   'Skills',
                   'Thats Carry On',
                   'The Bodyguard',
                   'The Hobbit: An Unexpected Journey',
                   'The Quiet Ones',
                   'The Top Five Finalists Perform',
                   'The Unnatural',
                   'Wilhelm Tell',
                   'Zig Zag')
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
                   'actress',
                   'editor',
                   'writer')
  AND it1.id IN ('2')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND it2.id IN ('3')
  AND mi2.info IN ('Action',
                    'Adult',
                    'Adventure',
                    'Animation',
                    'Comedy',
                    'Documentary',
                    'Drama',
                    'Family',
                    'Horror',
                    'News',
                    'Reality-TV',
                    'Romance',
                    'War',
                    'Western');