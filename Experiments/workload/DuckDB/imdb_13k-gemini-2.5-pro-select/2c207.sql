
SELECT COUNT(*)
FROM title AS t,
     cast_info AS ci,
     movie_info AS mi1,
     movie_info AS mi2
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.production_year <= 2015
  AND t.production_year >= 1990
  AND t.title IN ('(#1.6289)',
                   '(#1.7996)',
                   '(#3.21)',
                   '(#7.88)',
                   '(#8.195)',
                   '(2002-06-26)',
                   '(2005-09-04)',
                   '(2009-03-17)',
                   '(2010-10-16)',
                   'After',
                   'American Pie',
                   'Anger Management',
                   'Compassion',
                   'Dead Flowers',
                   'El soldadito de plomo',
                   'Girls Night',
                   'Halloween Havoc',
                   'I Love 1990',
                   'Jao and Mikay Fall Into a Bad Argument',
                   'Krusty Gets Kancelled',
                   'Memento Mori',
                   'Monument',
                   'Scorpio Nights 2',
                   'Stomp the Yard 2: Homecoming',
                   'The Passenger',
                   'The Projectionist',
                   'Too Much Information',
                   'Transamerican Killer',
                   'Victory',
                   'We Have Cleared the Tower',
                   'What About Me?',
                   'WrestleMania 22')
  AND mi1.info_type_id IN ('5')
  AND mi1.info IN ('Australia:M',
                    'Brazil:16',
                    'Canada:R',
                    'Germany:6',
                    'Portugal:M/6',
                    'UK:PG')
  AND mi2.info_type_id IN ('105')
  AND mi2.info IN ('$10,000',
                    '$13,000,000',
                    '$15,000,000',
                    '$17,000,000',
                    '$3,000,000',
                    '$3,500,000',
                    '$4,000,000',
                    '$5,000,000',
                    '$500,000',
                    '$6,000,000',
                    '$70,000,000',
                    '$75,000,000',
                    '$90,000,000')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'video game',
                   'video movie'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'editor',
                   'guest',
                   'producer'));