WITH t_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 2010
     AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game'))
SELECT COUNT(*)
FROM t_filtered
JOIN movie_info AS mi1 ON t_filtered.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t_filtered.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t_filtered.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t_filtered.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE it1.id IN ('3')
  AND mi1.info IN ('Action',
                    'Adventure',
                    'Comedy',
                    'Documentary',
                    'Drama',
                    'Horror',
                    'Music',
                    'Short',
                    'Sport',
                    'Thriller')
  AND it2.id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color')
  AND rt.role IN ('director')
  AND n.gender IS NULL
  AND k.keyword IN ('california-flag',
                     'danube',
                     'hampton-jitney',
                     'increased-susceptibiity-to-disease',
                     'international-press',
                     'layette',
                     'look-alike',
                     'mikvah',
                     'mixed-martial-arts',
                     'psycho-kid',
                     'reference-to-oneida-new-york',
                     'reference-to-ray-romano',
                     'river-pirates',
                     'rump-roast',
                     'segway-polo',
                     'shaken-by-the-shoulders',
                     'stripping-in-front-of-camera',
                     'weird-music');