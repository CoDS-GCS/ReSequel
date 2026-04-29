
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
  AND t.title IN ('(#1.11)',
                   '(#1.755)',
                   '(#1.890)',
                   'Beyond Reasonable Doubt',
                   'Cant Stop the Music',
                   'Catspaw',
                   'Coming to America',
                   'Convicted',
                   'Fallen Idol',
                   'Fathers and Music',
                   'Initiation',
                   'Little Girl Lost',
                   'Loose Screws',
                   'Secrets',
                   'Sins of the Fathers',
                   'The Babysitter',
                   'The Big Sleep',
                   'The Cotton Club',
                   'The End of the World',
                   'The Inside Man',
                   'The Pretender',
                   'The Talk Show',
                   'The Young and the Restless',
                   'Urgh! A Music War',
                   'Utilities',
                   'Whats in a Name?',
                   'Wish You Were Here',
                   'Working Girls')
  AND mi1.info_type_id IN ('5')
  AND mi1.info IN ('Argentina:16',
                    'Australia:G',
                    'Canada:14A',
                    'Canada:G',
                    'Canada:R',
                    'Finland:K-18',
                    'India:U',
                    'Netherlands:12',
                    'Portugal:M/16',
                    'Spain:18',
                    'UK:AA',
                    'USA:Not Rated')
  AND mi2.info_type_id IN ('4')
  AND mi2.info IN ('Danish',
                    'English',
                    'Finnish',
                    'French',
                    'German',
                    'Hindi',
                    'Italian',
                    'Japanese',
                    'Latin',
                    'Malayalam',
                    'Portuguese',
                    'Swedish')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('producer',
                   'writer'));