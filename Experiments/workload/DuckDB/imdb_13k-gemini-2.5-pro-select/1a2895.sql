
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1950 AND 1990
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('composer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('7')
  AND mi1.info IN ('LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                    'LAB:DeLuxe, Hollywood (CA), USA',
                    'LAB:DeLuxe, USA',
                    'PCS:CinemaScope',
                    'RAT:1.33 : 1')
  AND mi2.info_type_id IN ('18')
  AND mi2.info IN ('Bavaria Filmstudios, Geiselgasteig, Grünwald, Bavaria, Germany',
                    'Old Tucson - 201 S. Kinney Road, Tucson, Arizona, USA',
                    'Stage 23, Metro-Goldwyn-Mayer Studios - 10202 W. Washington Blvd., Culver City, California, USA',
                    'Stage 25, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 27A, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Washington, District of Columbia, USA');