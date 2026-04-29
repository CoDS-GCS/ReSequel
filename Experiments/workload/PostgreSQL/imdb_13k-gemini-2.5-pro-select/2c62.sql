WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 2015
     AND title IN ('(#1.1142)',
                   '(#1.234)',
                   '(#1.400)',
                   '(#10.6)',
                   '(#4.89)',
                   '(#5.79)',
                   '(1996-11-07)',
                   '(2001-06-08)',
                   '(2002-12-22)',
                   '(2003-01-27)',
                   '(2004-06-06)',
                   '(2004-09-18)',
                   '(2005-08-02)',
                   '(2010-03-28)',
                   '(2010-11-07)',
                   '(2011-12-27)',
                   'Aubrey',
                   'BB05 Daily Show: Day 5',
                   'Back to One',
                   'Before a Fall',
                   'Bomberman Live: Battlefest',
                   'Buried',
                   'Drew Barrymore',
                   'Forsaken',
                   'Fortune 500 Man',
                   'Goon',
                   'Iron Sky',
                   'Let Me Count the Ways',
                   'Looking Good',
                   'Mega Python vs. Gatoroid',
                   'Open Fire',
                   'Queen Bee',
                   'School for Seduction',
                   'Someone to Watch Over Me',
                   'The Better Half',
                   'The Bonfire of the Vanities',
                   'The Briefcase',
                   'The Invisible Woman',
                   'The Lizzie McGuire Movie',
                   'The Lovely Bones',
                   'The Thin Red Line',
                   'Three for the Road',
                   'To the Death',
                   'Totalschaden',
                   'Walking the Dog',
                   'White Men Cant Jump',
                   'Wozzeck',
                   'Yesterdays Tomorrow',
                   'You Need to Watch Your Jokes, Guy')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video movie'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('editor'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('2')
  AND mi2.info_type_id IN ('7')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info IN ('LAB:DuArt Film Laboratories Inc., New York, USA',
                    'LAB:Kinuta Laboratories, Tokyo, Japan',
                    'LAB:Technicolor',
                    'OFM:16 mm',
                    'OFM:Digital',
                    'OFM:Super 16',
                    'PCS:Digital Intermediate',
                    'PCS:Panavision',
                    'PCS:Redcode RAW',
                    'PCS:Techniscope',
                    'PFM:DVD-ROM',
                    'RAT:1.33 : 1',
                    'RAT:16:9 HD');