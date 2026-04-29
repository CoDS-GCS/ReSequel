WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND t.title IN ('(#1.0)',
                   '(#1.41)',
                   '(#1.43)',
                   '(#2.31)',
                   '(#2.8)',
                   '(#3.2)',
                   '(#5.6)',
                   '(#5.7)',
                   '(#6.24)',
                   'A Connecticut Yankee in King Arthurs Court',
                   'A Night Out',
                   'After the Ball',
                   'Blind Date',
                   'Crime Wave',
                   'Dobrý voják Svejk',
                   'Girls! Girls! Girls!',
                   'Island in the Sky',
                   'Ladies Man',
                   'Luxury Liner',
                   'Mayerling',
                   'Osvobozhdenie',
                   'Putney Swope',
                   'Reckless',
                   'Rio Grande',
                   'Tennessee Johnson',
                   'The Band Wagon',
                   'The Big Gamble',
                   'The Champ',
                   'The Engagement Ring',
                   'The Fighting Devil Dogs',
                   'The Heiress',
                   'The Hoodlum Saint',
                   'The Miracle of the Bells',
                   'The Outcast',
                   'The Sea Hawk',
                   'The Snows of Kilimanjaro',
                   'The Specialists',
                   'The Texas Rangers',
                   'Värmlänningarna',
                   'Whats in a Name?')
     AND kt.kind IN ('episode',
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
  AND rt.role IN ('composer')
  AND it1.id IN ('2')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND it2.id IN ('8')
  AND mi2.info IN ('Belgium',
                    'East Germany',
                    'Finland',
                    'Iran',
                    'Italy',
                    'Japan',
                    'Mexico',
                    'Netherlands',
                    'Philippines',
                    'Portugal',
                    'Spain',
                    'Sweden',
                    'Switzerland',
                    'Turkey',
                    'Yugoslavia');