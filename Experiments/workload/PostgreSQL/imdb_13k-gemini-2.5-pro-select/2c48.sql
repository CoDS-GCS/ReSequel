WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1990 AND 2015
     AND title IN ('(#1.4428)',
                   '(#1.5371)',
                   '(#1.9807)',
                   '(#17.20)',
                   '(#3.7)',
                   '(#6.135)',
                   '(#6.186)',
                   '(#7.64)',
                   '(2004-07-19)',
                   '(2004-12-22)',
                   '(2013-02-01)',
                   'Adventures of Gary Leon at Kuting',
                   'An Ill Wind',
                   'Autopsy',
                   'Black Dawn',
                   'Chris',
                   'Derby',
                   'DreamKeeper',
                   'Ella Enchanted',
                   'Fancypants',
                   'Field of Dreams',
                   'Forget Me Not',
                   'Less Is More',
                   'Lost Causes',
                   'Marisol',
                   'Mr. Nobody',
                   'Never Surrender',
                   'Oyster Farmer',
                   'Replay',
                   'Reward',
                   'Sexual Harassment',
                   'Stilyagi',
                   'Taking Chance',
                   'Tanging yaman',
                   'The Bonds of Matrimony',
                   'The Date',
                   'The Great Gatsby',
                   'The Life Before Her Eyes',
                   'The Royal Tenenbaums',
                   'The Wizard',
                   'Tom Arnold/Tupac Shakur',
                   'Town & Country',
                   'Twisted Sisters',
                   'Vaterliebe',
                   'Vicious Circle',
                   'Wild Horses',
                   'Wolves')
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
   WHERE gender IN ('m')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('6')
  AND mi2.info_type_id IN ('3')
  AND mi1.info IN ('6-Track Stereo',
                    'DTS',
                    'DTS-ES',
                    'Datasat',
                    'SDDS',
                    'Silent',
                    'Stereo')
  AND mi2.info IN ('Adult',
                    'Comedy',
                    'Horror',
                    'Musical',
                    'Mystery',
                    'Reality-TV',
                    'Sci-Fi',
                    'Short',
                    'Sport');