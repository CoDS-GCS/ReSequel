WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 2015
     AND title IN ('(#11.31)',
                   '(#5.39)',
                   '(1998-08-05)',
                   'Die Another Day',
                   'Life During Wartime',
                   'Never',
                   'Onihei hankachô',
                   'Pawns',
                   'South Beach',
                   'The Blob',
                   'The Book',
                   'The Brass Ring',
                   'The Flood',
                   'The Night Stalker',
                   'The Opposite Sex',
                   'Urban Jungle: PErshing Square')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'costume designer',
                   'director',
                   'guest',
                   'miscellaneous crew'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('1')
  AND mi2.info_type_id IN ('105')
  AND mi1.info IN ('7',
                    '86',
                    '9',
                    '90',
                    'USA:10',
                    'USA:13',
                    'USA:4')
  AND mi2.info IN ('$1,500',
                    '$15,000',
                    '$2,000',
                    '$200',
                    '$200,000',
                    '$25,000',
                    '$3,000,000',
                    '$30,000',
                    '$300',
                    '$50,000',
                    '$6,000',
                    '$75,000');