
SELECT COUNT(*)
FROM title AS t,
     cast_info AS ci,
     movie_info AS mi1,
     movie_info AS mi2
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.production_year <= 2015
  AND t.production_year >= 1975
  AND t.title IN ('(#1.4307)',
                   '(#1.450)',
                   '(#1.6030)',
                   '(#14.13)',
                   '(1998-11-06)',
                   '(2000-11-02)',
                   '(2002-05-24)',
                   '(2006-08-25)',
                   '(2007-04-25)',
                   '(2008-04-16)',
                   '(2010-07-24)',
                   '(2012-11-01)',
                   '(2013-03-14)',
                   'Annie Leibovitz: Life Through a Lens',
                   'Another Woman',
                   'Dead Ringer',
                   'Double Jeopardy',
                   'EastEnders: Christmas Party',
                   'Hang Time',
                   'I Dream of Jeannie',
                   'Invitation',
                   'La ley del silencio',
                   'La madrastra',
                   'Rufus',
                   'Semifinals Week 3',
                   'Staying Afloat',
                   'Stilyagi',
                   'Studs',
                   'Tanz auf dem Vulkan',
                   'Testosterone',
                   'The Cage',
                   'The Comedian',
                   'The Distinguished Gentleman',
                   'The German Grand Prix: Qualifying',
                   'The Last Party',
                   'The Merge',
                   'The Second Time Around',
                   'Tim Robbins',
                   'Top 6 Perform',
                   'Trouble in Mind',
                   'Two Weeks',
                   'Wendy Considers Forced Eviction',
                   'XX premios Goya',
                   'Xmas Story')
  AND mi1.info_type_id IN ('2')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info_type_id IN ('18')
  AND mi2.info IN ('Albuquerque, New Mexico, USA',
                    'Amsterdam, Noord-Holland, Netherlands',
                    'Barcelona, Cataluña, Spain',
                    'Budapest, Hungary',
                    'Germany',
                    'Israel',
                    'Montréal, Québec, Canada',
                    'New Orleans, Louisiana, USA',
                    'Phoenix, Arizona, USA',
                    'San Diego, California, USA',
                    'Stage 37, Universal Studios - 100 Universal City Plaza, Universal City, California, USA',
                    'Vancouver, British Columbia, Canada',
                    'Winnipeg, Manitoba, Canada')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'video movie'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'director',
                   'guest',
                   'producer'));