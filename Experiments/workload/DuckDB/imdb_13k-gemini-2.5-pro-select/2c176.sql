
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
  AND t.title IN ('(#1.48)',
                   '(#2.16)',
                   '(#2.2)',
                   '(#2.38)',
                   '(#4.4)',
                   '(#6.4)',
                   '(#8.6)',
                   'Above Suspicion',
                   'Above and Beyond',
                   'Altri tempi',
                   'Ambush',
                   'Behind the Mask',
                   'Chucho el Roto',
                   'Clash by Night',
                   'Double Jeopardy',
                   'El verdugo',
                   'Election 74',
                   'Fall Guy',
                   'Hell and High Water',
                   'Hollywood Hotel',
                   'House of Strangers',
                   'Impasse',
                   'Just My Luck',
                   'North West Mounted Police',
                   'Ride Em Cowboy',
                   'Second Honeymoon',
                   'Shine on Harvest Moon',
                   'South Pacific',
                   'Spartacus',
                   'The Bounty Hunter',
                   'The Countess',
                   'The Great Ziegfeld',
                   'The Gunman',
                   'The Jackpot',
                   'The Roaring Twenties',
                   'This Is the Army',
                   'This Land Is Mine',
                   'Tonka')
  AND mi1.info_type_id IN ('1')
  AND mi1.info IN ('105',
                    '15',
                    '25',
                    '62',
                    '68',
                    '74',
                    '81',
                    '99',
                    'USA:10')
  AND mi2.info_type_id IN ('6')
  AND mi2.info IN ('4-Track Stereo',
                    'Mono',
                    'Silent',
                    'Stereo')
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
     WHERE ROLE IN ('editor',
                   'production designer',
                   'writer'));