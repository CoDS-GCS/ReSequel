WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1875 AND 1975
     AND title IN ('(#2.4)',
                   '(#5.38)',
                   '(#5.9)',
                   'Anniversary',
                   'Behind the Mask',
                   'Big City',
                   'Deadline',
                   'Delayed Action',
                   'Don Juan Tenorio',
                   'Fast Company',
                   'Find the Lady',
                   'Flash Gordon',
                   'Fools Gold',
                   'Gold Fever',
                   'Hired Wife',
                   'KLK an PTX - Die Rote Kapelle',
                   'Key Witness',
                   'Marihuana',
                   'Maya',
                   'Mrs. Wiggs of the Cabbage Patch',
                   'My Wild Irish Rose',
                   'Overland Mail',
                   'Partners',
                   'Pot-Bouille',
                   'Rembrandt',
                   'Shichinin no samurai',
                   'The Adventurers',
                   'The Challenge',
                   'The Country Doctor',
                   'The Innocent',
                   'The Judge',
                   'The Long Wait',
                   'The Lottery',
                   'The Man Who Came to Dinner',
                   'The Opposite Sex',
                   'The Photographer',
                   'The Undercover Man',
                   'The Winslow Boy',
                   'Top Secret',
                   'Turnabout')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('movie',
                   'tv movie',
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
   WHERE ROLE IN ('actor',
                   'actress',
                   'cinematographer',
                   'guest',
                   'producer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('8')
  AND mi2.info_type_id IN ('5')
  AND mi1.info IN ('Argentina',
                    'Finland',
                    'Hong Kong',
                    'India',
                    'Italy',
                    'Japan',
                    'UK',
                    'USA')
  AND mi2.info IN ('Argentina:13',
                    'Canada:PG',
                    'Finland:K-16',
                    'Germany:16',
                    'USA:PG',
                    'USA:TV-PG',
                    'USA:Unrated',
                    'West Germany:6');