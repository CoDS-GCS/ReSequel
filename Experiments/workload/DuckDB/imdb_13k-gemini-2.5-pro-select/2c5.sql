WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND t.title IN ('(#1.103)',
                   '(#1.194)',
                   '(#1.303)',
                   '(#1.389)',
                   '(#1.598)',
                   '(#2.11)',
                   'Back to the Future Part II',
                   'Bound for Glory',
                   'Cover Girl',
                   'Daniel',
                   'Doctor Ducks Super Secret All-Purpose Sauce',
                   'Domino',
                   'Eternity',
                   'Hobsons Choice',
                   'Lily Tomlin',
                   'Mad Max Beyond Thunderdome',
                   'New Faces',
                   'Once Bitten',
                   'Prizzis Honor',
                   'Room at the Top',
                   'Star Wars',
                   'The Comedy of Errors',
                   'The Crush',
                   'The Naked and the Dead',
                   'The Newlywed Game',
                   'The Silent Partner',
                   'The Spoilers',
                   'The Wind of Change',
                   'Turning Point',
                   'Wedding',
                   'Winner Take All')
     AND kt.kind IN ('movie',
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
  AND rt.role IN ('costume designer',
                   'director',
                   'producer',
                   'production designer',
                   'writer')
  AND it1.id IN ('5')
  AND mi1.info IN ('Australia:R',
                    'France:U',
                    'India:U',
                    'South Korea:15',
                    'Sweden:Btl',
                    'UK:A',
                    'USA:TV-G')
  AND it2.id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color');