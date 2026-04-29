
SELECT COUNT(*)
FROM title AS t,
     cast_info AS ci,
     movie_info AS mi1,
     movie_info AS mi2
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.production_year <= 1990
  AND t.production_year >= 1950
  AND t.title IN ('(#1.14)',
                   '(#1.187)',
                   '(#1.326)',
                   '(#1.42)',
                   '(#1.486)',
                   '(#1.53)',
                   '(#11.5)',
                   '(#2.29)',
                   '(#3.22)',
                   '(#7.12)',
                   '(#9.24)',
                   'Abduction',
                   'Act of Vengeance',
                   'Death Sentence',
                   'Dyesebel',
                   'Fighting Back',
                   'For Richer, for Poorer',
                   'Home for Christmas',
                   'Hôtel Terminus',
                   'Its All Happening',
                   'Live and Let Die',
                   'Olho por Olho',
                   'Playing with Fire',
                   'Salsa',
                   'Shall We Dance?',
                   'Suburbia',
                   'The 43rd Annual Golden Globe Awards',
                   'The Awakening',
                   'The Final Test',
                   'The Great Escape',
                   'The Guiding Light',
                   'The Last Emperor',
                   'The Son Also Rises',
                   'Transitions',
                   'Werther',
                   'Whats Up, Doc?',
                   'Where Theres a Will...')
  AND mi1.info_type_id IN ('8')
  AND mi1.info IN ('Belgium',
                    'Georgia',
                    'India',
                    'Switzerland',
                    'UK',
                    'Venezuela')
  AND mi2.info_type_id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
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
     WHERE ROLE IN ('cinematographer',
                   'editor',
                   'guest',
                   'producer',
                   'production designer'));