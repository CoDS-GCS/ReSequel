 
 
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1925 AND 1975
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv series',
                   'video game',
                   'video movie'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('composer'))
  AND mi1.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('7'))
  AND mi1.info IN ('OFM:35 mm',
                    'OFM:Live',
                    'PCS:Spherical',
                    'PFM:35 mm',
                    'RAT:1.37 : 1')
  AND mi2.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('18'))
  AND mi2.info IN ('CBS Studio 50, New York City, New York, USA',
                    'Iverson Ranch - 1 Iverson Lane, Chatsworth, Los Angeles, California, USA',
                    'Metro-Goldwyn-Mayer Studios - 10202 W. Washington Blvd., Culver City, California, USA',
                    'Mexico',
                    'New York City, New York, USA',
                    'Paris, France',
                    'Stage 9, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA');