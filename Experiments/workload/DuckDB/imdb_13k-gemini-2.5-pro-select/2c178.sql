WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1950 AND 1990
     AND title IN ('(#1.103)',
                   '(#1.183)',
                   '(#1.245)',
                   '(#1.392)',
                   '(#1.439)',
                   '(#1.504)',
                   '(#1.679)',
                   '(#1.689)',
                   '(#1.962)',
                   '(#2.22)',
                   '(#2.27)',
                   '(1989-03-24)',
                   'A Matter of Choice',
                   'Brookside',
                   'Cindy',
                   'Comeback',
                   'Cops and Robbers',
                   'Firestorm',
                   'Heidi',
                   'His Brothers Keeper',
                   'Maybe Baby',
                   'No Exit',
                   'Popples',
                   'San Diego Chargers vs. Seattle Seahawks',
                   'Shakedown',
                   'Stree',
                   'The Best of Enemies',
                   'The Border',
                   'The Country Girl',
                   'The Decoy',
                   'The Hunted',
                   'The Savage',
                   'Uzicka Republika')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv series',
                   'video game'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'composer',
                   'guest',
                   'producer',
                   'writer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('7')
  AND mi2.info_type_id IN ('8')
  AND mi1.info IN ('CAM:Arriflex Cameras',
                    'CAM:Panaflex Camera and Lenses by Panavision',
                    'CAM:Panavision Cameras and Lenses',
                    'LAB:Boyana Film Laboratory, Sofia, Bulgaria',
                    'LAB:DeLuxe',
                    'LAB:Film Center, Mumbai, India',
                    'LAB:Fotofilm S.A., Madrid, Spain',
                    'LAB:Kinuta Laboratories, Tokyo, Japan',
                    'LAB:Rank Film Laboratories, Denham, UK',
                    'PCS:(anamorphic)',
                    'PFM:Video',
                    'RAT:1.37 : 1',
                    'RAT:4:3')
  AND mi2.info IN ('Argentina',
                    'Brazil',
                    'Iran',
                    'Italy',
                    'Netherlands',
                    'USA');