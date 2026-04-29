 
 
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1950 AND 1990
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'tv movie'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f',
                    'm'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('composer',
                   'editor'))
  AND mi1.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('8'))
  AND mi1.info IN ('Australia',
                    'Brazil',
                    'East Germany',
                    'Finland',
                    'France',
                    'Greece',
                    'Hong Kong',
                    'India',
                    'Japan',
                    'Mexico',
                    'Philippines',
                    'South Korea',
                    'Soviet Union',
                    'West Germany')
  AND mi2.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('4'))
  AND mi2.info IN ('Cantonese',
                    'English',
                    'Finnish',
                    'French',
                    'German',
                    'Greek',
                    'Hindi',
                    'Japanese',
                    'Korean',
                    'Mandarin',
                    'Portuguese',
                    'Russian',
                    'Spanish',
                    'Tagalog');