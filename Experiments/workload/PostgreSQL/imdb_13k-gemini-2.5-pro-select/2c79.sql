WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 2015
     AND t.title IN ('(#1.1012)',
                   '(#1.5375)',
                   '(#1.565)',
                   '(#1.814)',
                   '(#1.822)',
                   '(#14.60)',
                   '(#15.93)',
                   '(#4.54)',
                   '(#5.3)',
                   '(#6.167)',
                   '(#6.62)',
                   '(2002-01-29)',
                   '(2002-07-04)',
                   '(2005-07-14)',
                   '(2009-02-04)',
                   '1995 NFL Draft',
                   'Biohazard 5',
                   'Blowing Smoke',
                   'Death Penalty',
                   'Die Geisel',
                   'Fahrerflucht',
                   'Free Agent',
                   'Go with the Flow',
                   'Grand Finals: Results Night',
                   'Happy Trails',
                   'Hour 3',
                   'How the Finch Stole Christmas',
                   'InAlienable',
                   'Jessie',
                   'Jo Is Having Problems',
                   'La belle Hélène',
                   'Mind Games',
                   'Most',
                   'My Way',
                   'Nero',
                   'Punto y aparte',
                   'The Black Box',
                   'The Disciple',
                   'The Five-Year Engagement',
                   'The Mourning After',
                   'Trautes Heim',
                   'Travel Reservations',
                   'Under Siege',
                   'Under the Rainbow',
                   'Vengeance',
                   'Viva')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv series',
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
  AND rt.role IN ('cinematographer',
                   'writer')
  AND it1.id IN ('3')
  AND mi1.info IN ('Action',
                    'Animation',
                    'Crime',
                    'Family',
                    'Film-Noir',
                    'Musical',
                    'Mystery',
                    'News',
                    'Romance',
                    'Talk-Show')
  AND it2.id IN ('5')
  AND mi2.info IN ('Argentina:18',
                    'Denmark:11',
                    'Hong Kong:IIA',
                    'Hungary:14',
                    'New Zealand:M',
                    'New Zealand:R16',
                    'Sweden:11',
                    'Sweden:Btl',
                    'Switzerland:12',
                    'UK:PG',
                    'UK:U',
                    'USA:G');