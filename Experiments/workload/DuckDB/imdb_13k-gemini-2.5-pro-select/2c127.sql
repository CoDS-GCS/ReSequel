
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND t.title IN ('(#1.40)',
                   '(#1.53)',
                   '(#1.67)',
                   '(#2.22)',
                   '(#4.8)',
                   '(#5.23)',
                   '(#6.4)',
                   'A Stitch in Time',
                   'A beszélö köntös',
                   'Airport 1975',
                   'Breakdown',
                   'Chip Off the Old Block',
                   'Crime of Passion',
                   'Daddy Long Legs',
                   'Explosion',
                   'Framed',
                   'Hunted',
                   'Iceland',
                   'Its a Wonderful Life',
                   'Its in the Air',
                   'Jailbreak',
                   'Love Letters',
                   'Madame X',
                   'Nana',
                   'Partners',
                   'Quo Vadis',
                   'Roger la Honte',
                   'Sergeant Madden',
                   'Sisters',
                   'Summer Holiday',
                   'The Breaking Point',
                   'The Charge of the Light Brigade',
                   'The Drifter',
                   'The Face at the Window',
                   'The Farmers Daughter',
                   'The Gunfighter',
                   'The Heiress',
                   'The Kid from Texas',
                   'The Lottery',
                   'The Merry Widow',
                   'The Naked City',
                   'They Died with Their Boots On',
                   'Threes Company',
                   'Up Front',
                   'Waterloo Bridge')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv series',
                   'video game',
                   'video movie')) AS t_filtered
JOIN cast_info AS ci ON t_filtered.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t_filtered.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t_filtered.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE n.gender IS NULL
  AND rt.role IN ('producer',
                   'production designer')
  AND it1.id IN ('2')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND it2.id IN ('6')
  AND mi2.info IN ('Mono',
                    'Silent',
                    'Stereo');