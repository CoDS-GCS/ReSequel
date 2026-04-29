WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 1975
     AND title IN ('(#1.106)',
                   '(#1.12)',
                   '(#1.61)',
                   '(#1.85)',
                   '(#1.94)',
                   '(#4.25)',
                   '(#5.27)',
                   '(#6.2)',
                   '(#6.23)',
                   'Body and Soul',
                   'Casino Royale',
                   'Change of Heart',
                   'Checkmate',
                   'Chûshingura',
                   'Dead or Alive',
                   'Dick Tracys G-Men',
                   'Eagle Squadron',
                   'Festival',
                   'Golden Girl',
                   'Harlow',
                   'Johnny Belinda',
                   'Laura',
                   'Law and Disorder',
                   'Like Father, Like Son',
                   'Madame Sans-Gêne',
                   'Meet Danny Wilson',
                   'On the Run',
                   'Ryans Hope',
                   'Saboteur',
                   'Samson and Delilah',
                   'South Pacific',
                   'The Avengers',
                   'The Beginning or the End',
                   'The Box',
                   'The Greatest Story Ever Told',
                   'The Hustler',
                   'The Man Who Knew Too Much',
                   'The Professionals',
                   'The Story of Dr. Wassell',
                   'This Is the Life',
                   'Voyna i mir',
                   'Whats in a Name?')
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
   WHERE gender IN ('f',
                    'm')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('composer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('7')
  AND mi2.info_type_id IN ('8')
  AND mi1.info IN ('MET:200 m',
                    'OFM:Video',
                    'PCS:(anamorphic)',
                    'PCS:CinemaScope',
                    'PCS:Dyaliscope',
                    'PCS:Kinescope',
                    'PCS:Panavision',
                    'PCS:Spherical',
                    'PFM:35 mm',
                    'RAT:1.37 : 1',
                    'RAT:2.20 : 1')
  AND mi2.info IN ('Argentina',
                    'Canada',
                    'Czechoslovakia',
                    'Hong Kong',
                    'Hungary',
                    'Mexico',
                    'UK',
                    'West Germany',
                    'Yugoslavia');