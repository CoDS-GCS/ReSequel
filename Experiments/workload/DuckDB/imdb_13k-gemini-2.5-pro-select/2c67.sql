WITH filtered_t AS
  (SELECT t.id
   FROM title AS t
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND t.title IN ('(#7.2)',
                   'Brotherly Love',
                   'Confession',
                   'Death Trap',
                   'Jailbreak',
                   'Rio Grande',
                   'Sergeant Madden',
                   'Sun Valley Serenade',
                   'The Captive',
                   'The Debt',
                   'The Golden Fleece',
                   'The Green Pastures',
                   'The Kid',
                   'The Turning Point',
                   'Threes Company',
                   'Vanity Fair',
                   'Whirlpool')
     AND t.kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video movie')))
SELECT COUNT(*)
FROM filtered_t
JOIN cast_info AS ci ON filtered_t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON filtered_t.id = mi1.movie_id
JOIN movie_info AS mi2 ON filtered_t.id = mi2.movie_id
WHERE n.gender IS NULL
  AND rt.role IN ('costume designer',
                   'director',
                   'editor',
                   'guest')
  AND mi1.info_type_id IN ('18')
  AND mi1.info IN ('Chicago, Illinois, USA',
                    'Hal Roach Studios - 8822 Washington Blvd., Culver City, California, USA',
                    'Madrid, Spain',
                    'Mexico City, Distrito Federal, Mexico',
                    'Mexico',
                    'Paris, France',
                    'Philippines',
                    'Pinewood Studios, Iver Heath, Buckinghamshire, England, UK',
                    'Revue Studios, Hollywood, Los Angeles, California, USA',
                    'Rome, Lazio, Italy',
                    'San Francisco, California, USA',
                    'Shepperton Studios, Shepperton, Surrey, England, UK',
                    'Stage 9, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA')
  AND mi2.info_type_id IN ('8')
  AND mi2.info IN ('Australia',
                    'Belgium',
                    'Czechoslovakia',
                    'Germany',
                    'Soviet Union',
                    'Spain',
                    'USA');