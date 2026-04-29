
SELECT COUNT(*)
FROM title AS t,
     cast_info AS ci,
     movie_info AS mi1,
     movie_info AS mi2
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.production_year <= 2015
  AND t.production_year >= 1925
  AND t.title IN ('(#1.3564)',
                   '(#1.4665)',
                   '(#1.5359)',
                   '(#21.1)',
                   '(#4.12)',
                   '(#6.156)',
                   '(#6.24)',
                   '(#9.66)',
                   '(1997-07-11)',
                   '(2000-07-12)',
                   '(2001-09-21)',
                   '(2002-04-25)',
                   '(2002-09-16)',
                   '(2010-10-14)',
                   '(2011-10-07)',
                   '(2013-01-18)',
                   '33',
                   '8 päivää ensi-iltaan',
                   'A Friend of the Family',
                   'An Affair to Remember',
                   'Antitrust',
                   'Austin',
                   'Blood Oath',
                   'Cheating',
                   'Crash Twinsanity',
                   'Crazy Heart',
                   'De erfenis',
                   'Der Spieler',
                   'Fieber',
                   'Hot Shot',
                   'Larry the Cable Guys Hula-Palooza Christmas Luau',
                   'Light Sleeper',
                   'Little Marines 2',
                   'Madrid',
                   'Music Hall',
                   'Paper Man',
                   'Parental Guidance Suggested',
                   'Snapped',
                   'The Baxter',
                   'The Driver',
                   'The Girl in the Park',
                   'The Pit',
                   'We Shall Remain: Part III - Trail of Tears',
                   'Whos Got Game?')
  AND mi1.info_type_id IN ('8')
  AND mi1.info IN ('Argentina',
                    'Croatia',
                    'Denmark',
                    'Germany',
                    'Hungary',
                    'Israel',
                    'Luxembourg',
                    'Philippines',
                    'Puerto Rico',
                    'South Korea',
                    'Switzerland',
                    'United Arab Emirates')
  AND mi2.info_type_id IN ('1')
  AND mi2.info IN ('10',
                    '101',
                    '106',
                    '111',
                    '113',
                    '117',
                    '122',
                    '125',
                    '20',
                    '41',
                    '84',
                    'Germany:24',
                    'Japan:30',
                    'USA:57',
                    'USA:90')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv series',
                   'video game',
                   'video movie'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f',
                    'm'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'cinematographer',
                   'editor',
                   'producer'));