WITH t_kt AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year <= 2015
     AND t.production_year >= 1925
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
                   'video movie')),
     t_kt_ci AS
  (SELECT t_kt.id
   FROM t_kt
   JOIN cast_info AS ci ON t_kt.id = ci.movie_id
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IN ('f',
                    'm')
     AND rt.role IN ('cinematographer',
                   'writer')),
     t_kt_ci_mi1 AS
  (SELECT t_kt_ci.id
   FROM t_kt_ci
   JOIN movie_info AS mi1 ON t_kt_ci.id = mi1.movie_id
   WHERE mi1.info_type_id IN ('2')
     AND mi1.info IN ('Black and White',
                    'Color'))
SELECT COUNT(*)
FROM t_kt_ci_mi1
JOIN movie_info AS mi2 ON t_kt_ci_mi1.id = mi2.movie_id
WHERE mi2.info_type_id IN ('7')
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