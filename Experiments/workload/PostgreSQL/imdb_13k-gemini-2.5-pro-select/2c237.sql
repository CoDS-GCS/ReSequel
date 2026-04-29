WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 2015
     AND t.title IN ('(#1.3744)',
                   '(#1.4885)',
                   '(#1.934)',
                   '(#1.942)',
                   '(#15.94)',
                   '(#17.25)',
                   '(#2.253)',
                   '(#2.84)',
                   '(1997-04-29)',
                   '(2000-03-29)',
                   '(2000-10-10)',
                   '(2002-12-26)',
                   '(2003-12-07)',
                   '(2006-08-12)',
                   '(2007-02-28)',
                   '(2010-04-14)',
                   '(2013-04-30)',
                   '40 Days and 40 Nights',
                   'Allen',
                   'Allure',
                   'Anamorph',
                   'Canción de cuna',
                   'Carne de neón',
                   'Der Doppelgänger',
                   'Dont Hate the Player',
                   'Flypaper',
                   'Follow the Leader',
                   'Grad Night',
                   'Home Away from Home',
                   'Its Not Yet Over for Gino, So He Packs His Bag for Yangdon',
                   'Meet Market',
                   'Nighthawks',
                   'Pandoras Box',
                   'Piranha 3DD',
                   'Salad Days',
                   'The Brothers',
                   'The Brown Family',
                   'The Lawyer',
                   'The Lost Weekend',
                   'Three Kings',
                   'Underworld',
                   'Wouldnt It Be Nice')
     AND kt.kind IN ('episode',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
SELECT COUNT(*)
FROM filtered_movies AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE n.gender IN ('f',
                    'm')
  AND rt.role IN ('cinematographer',
                   'writer')
  AND it1.id IN ('2')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND it2.id IN ('7')
  AND mi2.info IN ('CAM:Arri Alexa',
                    'CAM:Arriflex Cameras and Lenses',
                    'LAB:Boyana Film Laboratory, Sofia, Bulgaria',
                    'OFM:16 mm',
                    'OFM:35 mm',
                    'OFM:Redcode RAW',
                    'PCS:(anamorphic)',
                    'PCS:Betacam SP',
                    'PCS:CinemaScope',
                    'PCS:Redcode RAW',
                    'PCS:Shawscope',
                    'PFM:16 mm',
                    'RAT:1.66 : 1',
                    'RAT:1.78 : 1 / (anamorphic)',
                    'RAT:1.78 : 1');