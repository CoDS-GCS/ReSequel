WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 2015
     AND title IN ('(#1.3386)',
                   '(#1.5382)',
                   '(#1.716)',
                   '(#16.44)',
                   '(#16.68)',
                   '(#17.150)',
                   '(#8.35)',
                   '(2000-04-13)',
                   '(2008-07-18)',
                   '(2012-10-03)',
                   '314',
                   'Circle of Life',
                   'Fully Loaded',
                   'Held Up',
                   'Hollywood Singing and Dancing: A Musical Treasure',
                   'Infection',
                   'Joy to the World',
                   'Just One Kiss',
                   'Miracles',
                   'Race to the Moon',
                   'Scooby-Doo',
                   'The Glove',
                   'The Japanese Grand Prix',
                   'Touch',
                   'Trafics',
                   'Truth or Consequences',
                   'Unnatural Causes')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
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
   WHERE ROLE IN ('producer',
                   'production designer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('3')
  AND mi2.info_type_id IN ('7')
  AND mi1.info IN ('Adult',
                    'Adventure',
                    'Animation',
                    'Biography',
                    'Comedy',
                    'Crime',
                    'Mystery',
                    'Reality-TV',
                    'Romance',
                    'Sci-Fi',
                    'Short',
                    'Sport')
  AND mi2.info IN ('CAM:Canon 5D Mark II',
                    'LAB:Fotofilm S.A., Madrid, Spain',
                    'LAB:Rank Film Laboratories, Denham, UK',
                    'LAB:Technicolor, Hollywood (CA), USA',
                    'OFM:Live',
                    'PCS:Digital Betacam',
                    'RAT:1.85 : 1');