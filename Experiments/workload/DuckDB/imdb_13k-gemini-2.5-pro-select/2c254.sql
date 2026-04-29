WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1975 AND 2015
     AND title IN ('(#1.1223)',
                   '(#17.65)',
                   '(#2.20)',
                   '(#3.141)',
                   '(1998-04-24)',
                   '(2000-11-29)',
                   '(2002-01-19)',
                   '(2005-04-27)',
                   '(2011-01-30)',
                   '(2012-01-04)',
                   '(2012-10-18)',
                   'A Cock and Bull Story',
                   'Ah, Wilderness',
                   'Bonanno: A Godfathers Story',
                   'Cinco de Mayo',
                   'Francesco',
                   'Lisa',
                   'Never Again',
                   'One Wrong Move',
                   'Perfect Strangers',
                   'Pig',
                   'Sacred',
                   'Tekken 5',
                   'The 54th Annual Academy Awards',
                   'The Christmas Tree',
                   'The Swap',
                   'The Warriors',
                   'Upstaged')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('movie',
                   'tv series',
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
   WHERE ROLE IN ('cinematographer',
                   'editor',
                   'guest',
                   'production designer'))
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
  AND mi2.info IN ('CAM:Canon 7D',
                    'CAM:Canon XL-1',
                    'OFM:16 mm',
                    'OFM:8 mm',
                    'PCS:(anamorphic)',
                    'PCS:Spherical',
                    'PCS:Super 16',
                    'RAT:1.33 : 1');