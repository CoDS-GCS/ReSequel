WITH filtered_t AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 2015
     AND t.title IN ('(#1.1142)',
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
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video movie')),
     filtered_ci AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE ci.movie_id IN
       (SELECT id
        FROM filtered_t)
     AND rt.role IN ('editor')
     AND (n.gender IN ('m')
          OR n.gender IS NULL)),
     filtered_mi1 AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   WHERE mi1.movie_id IN
       (SELECT id
        FROM filtered_t)
     AND mi1.info_type_id IN ('2')
     AND mi1.info IN ('Black and White',
                    'Color')),
     filtered_mi2 AS
  (SELECT mi2.movie_id
   FROM movie_info AS mi2
   WHERE mi2.movie_id IN
       (SELECT id
        FROM filtered_t)
     AND mi2.info_type_id IN ('7')
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
                    'RAT:16:9 HD'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN filtered_ci AS ci ON t.id = ci.movie_id
JOIN filtered_mi1 AS mi1 ON t.id = mi1.movie_id
JOIN filtered_mi2 AS mi2 ON t.id = mi2.movie_id;