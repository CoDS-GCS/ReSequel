
SELECT COUNT(*)
FROM title AS t,
     cast_info AS ci,
     movie_info AS mi1,
     movie_info AS mi2
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.production_year <= 1975
  AND t.production_year >= 1925
  AND t.title IN ('(#1.123)',
                   '(#1.28)',
                   '(#2.1)',
                   '(#2.20)',
                   '(#2.27)',
                   '(#2.49)',
                   '(#3.1)',
                   '(#3.24)',
                   '(#4.1)',
                   '(#4.16)',
                   '(#7.2)',
                   'A Friend in Need',
                   'Ambush',
                   'Bel Ami',
                   'Carry on Cowboy',
                   'Das verurteilte Dorf',
                   'Election 70',
                   'Fury',
                   'Gilda',
                   'Hostage',
                   'Lady by Choice',
                   'Marooned',
                   'Mutiny on the Bounty',
                   'Night Club',
                   'One Life to Live',
                   'Panic',
                   'Sanctuary',
                   'Shell Game',
                   'Sun Valley Serenade',
                   'The Baby',
                   'The Breaking Point',
                   'The Captain Hates the Sea',
                   'The Desert Fox: The Story of Rommel',
                   'The Eurovision Song Contest',
                   'The Executioners',
                   'The Guest',
                   'The Heiress',
                   'The Merchant of Venice',
                   'The Milkman',
                   'The Plunderers',
                   'The Tell-Tale Heart',
                   'The Tempest',
                   'The Victim',
                   'Topaze',
                   'Triple Cross')
  AND mi1.info_type_id IN ('1')
  AND mi1.info IN ('109',
                    '25',
                    '54',
                    '84',
                    'Germany:96',
                    'USA:20',
                    'USA:30',
                    'USA:8')
  AND mi2.info_type_id IN ('7')
  AND mi2.info IN ('LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                    'MET:300 m',
                    'OFM:16 mm',
                    'OFM:Video',
                    'PCS:CinemaScope',
                    'RAT:1.33 : 1',
                    'RAT:1.37 : 1')
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
     WHERE gender IN ('m'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'cinematographer',
                   'costume designer',
                   'guest'));