WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 2015
     AND title IN ('(#19.25)',
                   '(#8.71)',
                   '(1999-06-03)',
                   '(2007-08-13)',
                   '(2009-03-21)',
                   '(2010-12-07)',
                   'America: A Tribute to Heroes',
                   'Hold Up',
                   'Jacks Back',
                   'On Deadly Ground',
                   'Piece of Cake',
                   'Radio Silence',
                   'The Incident',
                   'Trapped',
                   'Une nouvelle vie')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv series',
                   'video game'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('composer',
                   'costume designer',
                   'director'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('105')
  AND mi2.info_type_id IN ('4')
  AND mi1.info IN ('$1,000',
                    '$3,500',
                    '$4,000,000',
                    '$5,000,000',
                    '$6,000',
                    '£10,000',
                    '£3,000',
                    '€ 1,000')
  AND mi2.info IN ('Danish',
                    'Dutch',
                    'English',
                    'German',
                    'Hebrew',
                    'Japanese',
                    'Korean',
                    'Mandarin',
                    'Swedish',
                    'Telugu');