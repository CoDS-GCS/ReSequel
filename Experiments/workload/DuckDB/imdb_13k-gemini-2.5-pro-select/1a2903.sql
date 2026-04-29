
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1950 AND 1990
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv series',
                   'video game',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('director',
                   'production designer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f',
                    'm')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('3')
  AND mi1.info IN ('Adult',
                    'Animation',
                    'Biography',
                    'Comedy',
                    'Drama',
                    'Family',
                    'Fantasy',
                    'Mystery',
                    'Sci-Fi',
                    'Thriller')
  AND mi2.info_type_id IN ('7')
  AND mi2.info IN ('LAB:Rank Film Laboratories, Denham, UK',
                    'PCS:CinemaScope',
                    'PCS:Spherical',
                    'PFM:16 mm',
                    'PFM:70 mm',
                    'RAT:4:3');