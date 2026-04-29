WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 1975
     AND title IN ('(#1.61)',
                   '(#3.4)',
                   '(#4.17)',
                   '(#4.29)',
                   '(#8.5)',
                   '12',
                   '2001: A Space Odyssey',
                   'A Shot in the Dark',
                   'Anna Christie',
                   'Anniversary',
                   'Assignment in Brittany',
                   'Bad Guy',
                   'Barabba',
                   'Boy Meets Girl',
                   'Dark Victory',
                   'Dead or Alive',
                   'Dick Tracys G-Men',
                   'Familie Benthin',
                   'Foreign Correspondent',
                   'Haunted House',
                   'Ill Tell the World',
                   'King of the Mountain',
                   'Kismet',
                   'M',
                   'Olympia 1. Teil - Fest der Völker',
                   'Sarajevski atentat',
                   'Something for the Birds',
                   'The Auction',
                   'The Cat and the Fiddle',
                   'The Dream',
                   'The Gypsies',
                   'The Harder They Fall',
                   'The Hound of the Baskervilles',
                   'The Morning After',
                   'The Payoff',
                   'The Princess',
                   'The Professionals',
                   'The Rainmaker',
                   'The Whole Truth',
                   'They Drive by Night',
                   'This Land Is Mine',
                   'Three Kids and a Queen',
                   'Titanic',
                   'Welcome Home',
                   'Windfall',
                   'Winner Take All')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('movie',
                   'tv movie',
                   'tv series',
                   'video movie'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('cinematographer',
                   'composer',
                   'editor',
                   'miscellaneous crew',
                   'writer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('8')
  AND mi2.info_type_id IN ('2')
  AND mi1.info IN ('Australia',
                    'Denmark',
                    'Finland',
                    'Soviet Union',
                    'USA',
                    'West Germany')
  AND mi2.info IN ('Black and White',
                    'Color');