WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1950 AND 1990
     AND title IN ('(#1.107)',
                   '(#1.16)',
                   '(#1.36)',
                   '(#1.475)',
                   '(#1.595)',
                   '(#1.60)',
                   '(#1.725)',
                   '(#3.32)',
                   '(#8.19)',
                   'A House Divided',
                   'Backfire',
                   'Bon Voyage',
                   'Chicago Bears vs. Minnesota Vikings',
                   'Dansk melodi grand prix',
                   'Das Vermächtnis',
                   'Dead End City',
                   'Ein Kapitel für sich',
                   'Ein Sommernachtstraum',
                   'Fandango',
                   'Hanussen',
                   'Letting Go',
                   'Lover Boy',
                   'Madeleine',
                   'Men of Respect',
                   'Mind Your Own Business',
                   'Pacific Heights',
                   'Part 2',
                   'Running on Empty',
                   'Search and Destroy',
                   'Soledad',
                   'Starting Over',
                   'The Actor',
                   'The Call',
                   'The Contract',
                   'The Divorce',
                   'The Elopement',
                   'The Howling',
                   'Under the Rainbow',
                   'Wedding')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('movie',
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
   WHERE ROLE IN ('costume designer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('1')
  AND mi2.info_type_id IN ('6')
  AND mi1.info IN ('102',
                    '105',
                    '22',
                    '50',
                    '87',
                    '90',
                    '93',
                    '99',
                    'USA:100',
                    'USA:30',
                    'USA:60')
  AND mi2.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'Mono',
                    'Stereo');