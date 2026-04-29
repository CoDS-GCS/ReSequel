WITH filtered_t AS
  (SELECT t.id
   FROM title AS t
   WHERE t.production_year BETWEEN 1990 AND 2015
     AND t.title IN ('(#1.5460)',
                   '(#1.6064)',
                   '(#1.6304)',
                   '(#12.51)',
                   '(#18.20)',
                   '(#6.122)',
                   '(#6.138)',
                   '(#9.67)',
                   '(1999-04-14)',
                   '(1999-11-09)',
                   '(2002-11-29)',
                   '(2007-03-15)',
                   '(2007-11-12)',
                   '1492',
                   'A Brady, a Lady, a Kiss and a Flo',
                   'A Mighty Heart',
                   'A New Life: Part 1',
                   'Airheads',
                   'Alive and Kicking',
                   'Barbara',
                   'Black and White',
                   'Bruce Almighty',
                   'Candy Wars',
                   'Celebrity Special',
                   'Civilization III: Conquests',
                   'Cynthia Nixon',
                   'Daylight Savings',
                   'Divine Manipulation of the Threads',
                   'Drowning',
                   'Every Move You Make',
                   'Excess Baggage',
                   'False Colors',
                   'Far and Away',
                   'Get Bass',
                   'Gino and Kiko Fight Over Mikay',
                   'Hijack',
                   'Homer Defined',
                   'ID',
                   'If the Shoe Fits',
                   'Man vs. Beast',
                   'Off the Track',
                   'Retrouvailles',
                   'Revenge Is Sweet',
                   'San Francisco 49ers vs. Los Angeles Rams',
                   'Sospechas',
                   'Stomp the Yard',
                   'Stuart Little',
                   'The Name',
                   'The Pearl',
                   'Unusual Suspects')
     AND t.kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'video game',
                   'video movie')))
SELECT COUNT(*)
FROM filtered_t
JOIN cast_info AS ci ON filtered_t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON filtered_t.id = mi1.movie_id
JOIN movie_info AS mi2 ON filtered_t.id = mi2.movie_id
WHERE n.gender IS NULL
  AND rt.role IN ('actor',
                   'actress',
                   'cinematographer',
                   'composer',
                   'director')
  AND mi1.info_type_id IN ('7')
  AND mi1.info IN ('CAM:Arriflex Cameras',
                    'CAM:Canon XL-2',
                    'CAM:Panaflex Camera and Lenses by Panavision',
                    'CAM:Panasonic AG-HVX200',
                    'CAM:Panavision Cameras and Lenses',
                    'CAM:Red One Camera',
                    'LAB:DuArt Film Laboratories Inc., New York, USA',
                    'LAB:Technicolor, Hollywood (CA), USA',
                    'OFM:Super 16',
                    'PCS:Betacam SP',
                    'PCS:Digital Betacam',
                    'PCS:Redcode RAW',
                    'PFM:16 mm',
                    'RAT:16:9 HD')
  AND mi2.info_type_id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color');