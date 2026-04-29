
SELECT COUNT(*)
FROM title AS t,
     cast_info AS ci,
     movie_info AS mi1,
     movie_info AS mi2
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.production_year <= 1975
  AND t.production_year >= 1925
  AND t.title IN ('(#1.31)',
                   '(#1.37)',
                   '(#1.7)',
                   '(#2.19)',
                   '(#4.14)',
                   '(#8.10)',
                   'Above Suspicion',
                   'Anna Christie',
                   'Anything Goes',
                   'Aoi sanmyaku',
                   'Battle of Britain',
                   'Beyond the Law',
                   'Blind Spot',
                   'Compact',
                   'Dead Reckoning',
                   'Down on the Farm',
                   'Ebb Tide',
                   'Erziehung vor Verdun. Der große Krieg der weißen Männer',
                   'Find the Lady',
                   'Gasparone',
                   'Hazard',
                   'Heidi',
                   'Jailbreak',
                   'Janie',
                   'Kid Galahad',
                   'Manpower',
                   'Melodi grand prix',
                   'Mr. Deeds Goes to Town',
                   'Nocturne',
                   'Osvobozhdenie',
                   'Peggy',
                   'Sea Devils',
                   'Seven Keys to Baldpate',
                   'She Gets Her Man',
                   'Summer Holiday',
                   'The Accused',
                   'The Amazing Exploits of the Clutching Hand',
                   'The Assassins',
                   'The Clock',
                   'The Dream',
                   'The Elopement',
                   'The Harvey Girls',
                   'The Hiding Place',
                   'The Love God?',
                   'The Red Shoes',
                   'The Set Up',
                   'Twelfth Night')
  AND mi1.info_type_id IN ('7')
  AND mi1.info IN ('LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                    'LAB:Technicolor, Hollywood (CA), USA',
                    'OFM:16 mm',
                    'OFM:65 mm',
                    'OFM:Video',
                    'PCS:CinemaScope',
                    'PCS:Kinescope',
                    'PFM:35 mm',
                    'PFM:8 mm',
                    'PFM:Video',
                    'RAT:1.20 : 1',
                    'RAT:1.78 : 1')
  AND mi2.info_type_id IN ('18')
  AND mi2.info IN ('Biograph Studios, Bronx, New York City, New York, USA',
                    'California, USA',
                    'General Service Studios - 1040 N. Las Palmas, Hollywood, Los Angeles, California, USA',
                    'Hal Roach Studios - 8822 Washington Blvd., Culver City, California, USA',
                    'Los Angeles, California, USA',
                    'Metro-Goldwyn-Mayer Studios - 10202 W. Washington Blvd., Culver City, California, USA',
                    'Nettlefold Studios, Walton-on-Thames, Surrey, England, UK',
                    'Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Stage 18, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Stage 18, Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Stage 2, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 4, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Stage 4, Stage 1, Stage 1, NBC Studios - 3000 W. Alameda Avenue, Burbank, California, USA',
                    'Stage 9, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f',
                    'm'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('cinematographer',
                   'director',
                   'producer'));