WITH t_filtered AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND kt.kind IN ('episode',
                   'tv movie'))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE mi1.info_type_id IN ('18')
  AND mi1.info IN ('Desilu Studios - 9336 W. Washington Blvd., Culver City, California, USA',
                    'General Service Studios - 1040 N. Las Palmas, Hollywood, Los Angeles, California, USA',
                    'Hal Roach Studios - 8822 Washington Blvd., Culver City, California, USA',
                    'Metro-Goldwyn-Mayer Studios - 10202 W. Washington Blvd., Culver City, California, USA',
                    'Mexico',
                    'New York City, New York, USA',
                    'Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Republic Studios - 4024 Radford Avenue, North Hollywood, Los Angeles, California, USA',
                    'Revue Studios, Hollywood, Los Angeles, California, USA',
                    'Universal Studios - 100 Universal City Plaza, Universal City, California, USA',
                    'Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA')
  AND mi2.info_type_id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color')
  AND n.gender IN ('m')
  AND rt.role IN ('producer',
                   'writer')
  AND k.keyword IN ('bookworm',
                     'breast-electrode',
                     'carinhall-germany',
                     'carrying-lover-upstairs',
                     'companionship',
                     'drinking-contest',
                     'green-party',
                     'hiding-under-a-mattress',
                     'international-labor-organization',
                     'mayflower-moving-van',
                     'murdered-nun',
                     'myoptic',
                     'nurse-heroine',
                     'pickup',
                     'political-turmoil',
                     'psychotic-breaks',
                     'racist',
                     'reference-to-ernest-e.-evans',
                     'rocks-crashing-through-the-roof',
                     'state-visit',
                     'talking-cat',
                     'thomas-mann',
                     'vampire-girl',
                     'wooden-teeth');