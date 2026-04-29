WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1950 AND 1990
     AND title IN ('(#10.3)',
                   '(#11.2)',
                   '(#8.23)',
                   'Alice',
                   'Assault',
                   'Christmas Story',
                   'Devils Canyon',
                   'Don Giovanni',
                   'From Here to Maternity',
                   'I Spy',
                   'Joulukalenteri',
                   'Los Angeles Rams vs. Atlanta Falcons',
                   'Lucifer',
                   'Masquerade',
                   'Quarterback Sneak',
                   'Shag',
                   'The Amateur',
                   'The Devil You Know',
                   'The Move')
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
   WHERE ROLE IN ('actress',
                   'editor',
                   'guest',
                   'producer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('18')
  AND mi2.info_type_id IN ('8')
  AND mi1.info IN ('Barcelona, Cataluña, Spain',
                    'Berlin, Germany',
                    'CBS Studio Center - 4024 Radford Avenue, Studio City, Los Angeles, California, USA',
                    'Hawaii, USA',
                    'Lisbon, Portugal',
                    'Metro-Goldwyn-Mayer Studios - 10202 W. Washington Blvd., Culver City, California, USA',
                    'Montréal, Québec, Canada',
                    'Sydney, New South Wales, Australia',
                    'Vienna, Austria')
  AND mi2.info IN ('Belgium',
                    'Brazil',
                    'Canada',
                    'Poland',
                    'West Germany');