WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 1975
     AND t.title IN ('(#1.40)',
                   '(#2.17)',
                   '(#5.19)',
                   'Airport 1975',
                   'Anna Karenina',
                   'Arashi o yobu otoko',
                   'Blaze of Glory',
                   'Born to Be Bad',
                   'Call Me Mister',
                   'Chain of Events',
                   'Der Hexer',
                   'Galileo',
                   'Game 5',
                   'Kid Galahad',
                   'Of Human Bondage',
                   'Once a Thief',
                   'Overland Mail',
                   'Pacific Blackout',
                   'Scrooge',
                   'Side Street',
                   'Sister Kenny',
                   'Smile',
                   'Special Agent',
                   'Tango',
                   'The Comic',
                   'The Gold Rush',
                   'The Last Man',
                   'The Losers',
                   'The Loves of Carmen',
                   'The Reckoning',
                   'The Second Time Around',
                   'The Snake Pit',
                   'The Trial',
                   'The Witch',
                   'Three Kids and a Queen')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
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
  AND rt.role IN ('writer')
  AND it1.id IN ('3')
  AND mi1.info IN ('Crime',
                    'Drama',
                    'Romance',
                    'War',
                    'Western')
  AND it2.id IN ('5')
  AND mi2.info IN ('Argentina:13',
                    'Argentina:18',
                    'Australia:R',
                    'Iceland:L',
                    'South Korea:All',
                    'UK:18',
                    'USA:TV-G',
                    'USA:X');