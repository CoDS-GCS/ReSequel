WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1990 AND 2015
     AND title IN ('(#1.4119)',
                   '(#1.5596)',
                   '(#1.578)',
                   '(#12.19)',
                   '(#2.120)',
                   '(#5.58)',
                   '(1999-10-11)',
                   '(2005-03-16)',
                   '(2006-04-05)',
                   '(2009-11-22)',
                   'A Knight to Remember',
                   'Aint No Sunshine',
                   'And Then There Was One',
                   'Auf Messers Schneide',
                   'Breaking the Waves',
                   'Burning Love',
                   'Escape',
                   'How She Move',
                   'Im Supposed to Be Indebted to Her for the Rest of the Race?!',
                   'Iskrenie',
                   'Iwo Jima',
                   'Jon Meacham',
                   'Last Supper',
                   'Live Results Show #5',
                   'Love Me Again (Land Down Under)',
                   'Next of Kin',
                   'The Imaginarium of Doctor Parnassus',
                   'The Kindred',
                   'Top of the Cops',
                   'Undercurrent',
                   'What About Bob?',
                   'What the #$*! Do We (K)now!?',
                   'Will')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('cinematographer',
                   'costume designer',
                   'director',
                   'production designer',
                   'writer'))
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
  AND mi2.info IN ('CAM:Arriflex Cameras',
                    'LAB:DeLuxe',
                    'PCS:DV',
                    'PCS:Digital Intermediate',
                    'PFM:35 mm',
                    'RAT:1.66 : 1',
                    'RAT:1.78 : 1 / (high definition)',
                    'RAT:1.78 : 1',
                    'RAT:1.85 : 1',
                    'RAT:16:9 HD');