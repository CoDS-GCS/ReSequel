WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 2015
     AND t.title IN ('(#1.1140)',
                   '(#1.5535)',
                   '(#11.13)',
                   '(#3.21)',
                   '(#8.159)',
                   '(1999-03-17)',
                   '(2001-12-28)',
                   '(2006-05-18)',
                   '(2006-08-07)',
                   '(2009-12-10)',
                   '(2013-01-15)',
                   '(2013-04-30)',
                   'Alone in a Crowd',
                   'Annie Hall',
                   'Atlantic City',
                   'Black & White',
                   'Blitz',
                   'City on Fire',
                   'Cold-Blooded',
                   'Der falsche Mann',
                   'Dirty Tricks',
                   'Elvis Has Left the Building',
                   'Happiness Runs',
                   'Jackpot',
                   'Man Outside',
                   'Manifest Destiny',
                   'On Guard',
                   'Rampart',
                   'Secret Societies',
                   'Soul Food',
                   'The Draft',
                   'The Rainbow Warrior',
                   'Valiant',
                   'What Happens Next',
                   'Without Limits',
                   'Word of Honor',
                   'Zero Tolerance',
                   'Über den Wolken')
     AND kt.kind IN ('episode',
                   'movie',
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
WHERE n.gender IN ('m')
  AND rt.role IN ('producer')
  AND it1.id IN ('2')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND it2.id IN ('8')
  AND mi2.info IN ('Argentina',
                    'Austria',
                    'Brazil',
                    'Chile',
                    'Denmark',
                    'Estonia',
                    'Georgia',
                    'Israel',
                    'Pakistan',
                    'Romania',
                    'USA');