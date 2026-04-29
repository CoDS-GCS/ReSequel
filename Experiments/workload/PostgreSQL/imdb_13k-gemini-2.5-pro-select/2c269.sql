WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1875 AND 1975
     AND title IN ('(#1.43)',
                   '(#1.50)',
                   '(#3.30)',
                   'A Guy Named Joe',
                   'Angel',
                   'Angels with Dirty Faces',
                   'Bad Guy',
                   'Because of You',
                   'Beyond Our Control',
                   'Buried Treasure',
                   'Fandango',
                   'Follow the Leader',
                   'Gilda',
                   'Here Comes the Groom',
                   'Holnap lesz fácán',
                   'Home',
                   'Laura',
                   'Lil Abner',
                   'Mary of Scotland',
                   'Outrage',
                   'Party Girl',
                   'Pension Schöller',
                   'Please Believe Me',
                   'Quinta puntata',
                   'Roberta',
                   'Sarajevski atentat',
                   'Si Versailles métait conté',
                   'Stormy Weather',
                   'The Big Broadcast',
                   'The Decision',
                   'The Great Race',
                   'The Green Pastures',
                   'The Hustler',
                   'The Light That Failed',
                   'The Passenger',
                   'The Seventh Cross',
                   'The System',
                   'The Tell-Tale Heart',
                   'The Trap',
                   'The Trouble with Women',
                   'Thomas Müntzer',
                   'Topaze',
                   'Your Witness')
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
   WHERE ROLE IN ('actress'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('7')
  AND mi2.info_type_id IN ('1')
  AND mi1.info IN ('MET:600 m',
                    'PCS:CinemaScope',
                    'PCS:Tohoscope',
                    'PFM:70 mm',
                    'RAT:1.20 : 1',
                    'RAT:1.33 : 1',
                    'RAT:1.66 : 1',
                    'RAT:4:3')
  AND mi2.info IN ('10',
                    '113',
                    '16',
                    '20',
                    '23',
                    '54',
                    '61',
                    '63',
                    '73',
                    '79',
                    '94',
                    'USA:75');