 
 WITH t_filtered AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 1975
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie')))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE mi1.info_type_id IN ('8')
  AND mi2.info_type_id IN ('18')
  AND mi1.info IN ('Mexico',
                    'USA')
  AND mi2.info IN ('CBS Studio 50, New York City, New York, USA',
                    'Desilu Studios - 9336 W. Washington Blvd., Culver City, California, USA',
                    'Iverson Ranch - 1 Iverson Lane, Chatsworth, Los Angeles, California, USA',
                    'Metro-Goldwyn-Mayer Studios - 10202 W. Washington Blvd., Culver City, California, USA',
                    'Mexico',
                    'New York City, New York, USA',
                    'Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Universal Studios - 100 Universal City Plaza, Universal City, California, USA',
                    'Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'miscellaneous crew'))
  AND (n.gender IN ('f')
       OR n.gender IS NULL);