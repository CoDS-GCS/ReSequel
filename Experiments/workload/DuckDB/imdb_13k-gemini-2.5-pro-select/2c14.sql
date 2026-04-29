WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 1975
     AND t.title IN ('(#1.18)',
                   '(#1.54)',
                   '(#2.9)',
                   '(#3.15)',
                   '(#5.17)',
                   'Abe Lincoln in Illinois',
                   'Accidents Will Happen',
                   'Akô rôshi - Ten no maki; Chi no maki',
                   'Anthony Adverse',
                   'Avalanche',
                   'Bedtime Story',
                   'Boccaccio',
                   'Crime of Passion',
                   'Die Unbesiegbaren',
                   'Fall Guy',
                   'Fools Gold',
                   'Foreign Correspondent',
                   'Gold Fever',
                   'Holnap lesz fácán',
                   'House of Strangers',
                   'Im weißen Rößl',
                   'Its a Wonderful World',
                   'Little Boy Lost',
                   'North to Alaska',
                   'One More River',
                   'Pot-Bouille',
                   'Ricochet',
                   'Seven Sinners',
                   'Skin Game',
                   'Success Story',
                   'Summer Holiday',
                   'The Bounty Hunter',
                   'The Eurovision Song Contest',
                   'The Facts of Life',
                   'The Golden Fleecing',
                   'The King of Kings',
                   'The Love Machine',
                   'The Matchmaker',
                   'The Miracle',
                   'The Opposite Sex',
                   'The Plainsman',
                   'The Recruit',
                   'The Visit',
                   'The Wrong Man',
                   'Waterfront',
                   'Wyoming',
                   'Yellow Jack')
     AND kt.kind IN ('episode',
                   'tv movie',
                   'tv series',
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
WHERE n.gender IN ('m')
  AND rt.role IN ('cinematographer',
                   'composer',
                   'costume designer',
                   'guest',
                   'miscellaneous crew')
  AND it1.id IN ('18')
  AND mi1.info IN ('20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Buenos Aires, Federal District, Argentina',
                    'Hollywood, Los Angeles, California, USA',
                    'Los Angeles, California, USA',
                    'Madrid, Spain',
                    'Metro-Goldwyn-Mayer Studios - 10202 W. Washington Blvd., Culver City, California, USA',
                    'Mexico City, Distrito Federal, Mexico',
                    'Rome, Lazio, Italy',
                    'Stage 18, Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA')
  AND it2.id IN ('8')
  AND mi2.info IN ('Argentina',
                    'Austria',
                    'Belgium',
                    'Czechoslovakia',
                    'Finland',
                    'Germany',
                    'Italy',
                    'Japan',
                    'Mexico',
                    'Soviet Union',
                    'Spain',
                    'Sweden',
                    'USA',
                    'West Germany');