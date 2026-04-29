WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1990 AND 2015
     AND title IN ('(#1.2741)',
                   '(#1.3469)',
                   '(#2.42)',
                   '(#9.26)',
                   '(2000-07-27)',
                   '(2003-06-19)',
                   '(2005-04-06)',
                   '(2007-03-11)',
                   '(2007-06-08)',
                   '10,000 BC',
                   'A Simple Twist of Fate',
                   'Animus',
                   'Atomic Train',
                   'Judgment Day',
                   'Last Rites',
                   'Lets Do It',
                   'Live Show 2',
                   'Live Surprise',
                   'Seems Like Old Times',
                   'Shopping',
                   'The Final Two Perform',
                   'Waynes World')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('production designer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('6')
  AND mi2.info_type_id IN ('5')
  AND mi1.info IN ('70 mm 6-Track',
                    'DTS-ES',
                    'DTS-Stereo',
                    'Dolby Digital EX',
                    'Dolby Digital',
                    'Dolby SR',
                    'Dolby Stereo',
                    'Dolby',
                    'Mono',
                    'SDDS',
                    'Sonics-DDP',
                    'Stereo',
                    'Ultra Stereo')
  AND mi2.info IN ('Argentina:18',
                    'Brazil:16',
                    'Canada:18A',
                    'Chile:14',
                    'Finland:K-13',
                    'Hong Kong:IIA',
                    'Italy:VM14',
                    'Portugal:M/6',
                    'Spain:18',
                    'UK:18',
                    'UK:U',
                    'USA:PG',
                    'USA:TV-14');