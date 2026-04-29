WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND t.title IN ('(#1.22)',
                   '(#1.72)',
                   '(#2.2)',
                   '(#5.4)',
                   'Dick Tracys G-Men',
                   'Game 7',
                   'High Society',
                   'Life with Father',
                   'Madame Bovary',
                   'Man of a Thousand Faces',
                   'Masquerade',
                   'Part 4',
                   'Raffles',
                   'Tennessee Johnson',
                   'Thats Entertainment!',
                   'The Pit',
                   'The Ten Commandments',
                   'True Confession')
     AND kt.kind IN ('movie',
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
WHERE n.gender IN ('f',
                    'm')
  AND rt.role IN ('production designer',
                   'writer')
  AND it1.id IN ('5')
  AND mi1.info IN ('Argentina:Atp',
                    'Canada:G',
                    'Finland:(Banned)',
                    'Iceland:16',
                    'Italy:VM14',
                    'Italy:VM18',
                    'Spain:T',
                    'Sweden:11',
                    'UK:12',
                    'UK:PG',
                    'UK:U',
                    'USA:Approved',
                    'USA:G',
                    'USA:R',
                    'USA:Unrated')
  AND it2.id IN ('4')
  AND mi2.info IN ('English',
                    'Finnish',
                    'French',
                    'Hindi',
                    'Latin',
                    'Mandarin',
                    'Russian',
                    'Spanish',
                    'Swedish');