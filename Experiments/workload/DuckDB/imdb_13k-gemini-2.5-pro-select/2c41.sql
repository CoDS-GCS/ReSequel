
SELECT COUNT(*)
FROM title AS t
WHERE t.production_year BETWEEN 1975 AND 2015
  AND t.title IN ('(#1.1002)',
                   '(#1.1744)',
                   '(#1.3001)',
                   '(#1.3479)',
                   '(#12.25)',
                   '(#16.171)',
                   '(#6.107)',
                   '(1998-02-23)',
                   '(2009-01-19)',
                   '(2011-03-21)',
                   'A Return to Normalcy',
                   'Acosada',
                   'Agency',
                   'American Primitive',
                   'Betty White',
                   'Beyond JFK: The Question of Conspiracy',
                   'Charm',
                   'Desperate Acts of Magic',
                   'End Run',
                   'Game Night 5',
                   'Godzilla',
                   'Good Intentions',
                   'Gran final: Part 2',
                   'Heaven and Hell',
                   'Invincible',
                   'Jack Frost',
                   'Jian guo da ye',
                   'Just My Luck',
                   'Luna llena',
                   'Mac',
                   'Man on the Moon',
                   'No Secrets',
                   'Perfect Match',
                   'Rock and a Hard Place',
                   'Smoke on the Water',
                   'Sneeze',
                   'Talk to the Hand',
                   'Team High Voltage Wont Let Their Teammates Transfer to Team Wayuk',
                   'The Cider House Rules',
                   'The Mark',
                   'The Perfect Crime',
                   'TimeScapes',
                   'Titus Andronicus',
                   'U.S. Marshals',
                   'Whos Got Game?',
                   'Why Did You Have to Take Your Pants Off?!',
                   'Worm')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'tv movie',
                   'tv series',
                   'video game'))
  AND EXISTS
    (SELECT 1
     FROM movie_info AS mi1
     WHERE mi1.movie_id = t.id
       AND mi1.info_type_id IN ('2')
       AND mi1.info IN ('Black and White',
                    'Color'))
  AND EXISTS
    (SELECT 1
     FROM movie_info AS mi2
     WHERE mi2.movie_id = t.id
       AND mi2.info_type_id IN ('6')
       AND mi2.info IN ('DTS',
                    'Dolby Digital',
                    'Dolby SR',
                    'Dolby',
                    'Mono',
                    'Silent',
                    'Stereo',
                    'Ultra Stereo'))
  AND EXISTS
    (SELECT 1
     FROM cast_info AS ci
     JOIN name AS n ON ci.person_id = n.id
     JOIN role_type AS rt ON ci.role_id = rt.id
     WHERE ci.movie_id = t.id
       AND rt.role IN ('production designer')
       AND (n.gender IN ('f')
            OR n.gender IS NULL));