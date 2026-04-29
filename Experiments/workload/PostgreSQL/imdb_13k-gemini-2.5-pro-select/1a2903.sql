WITH filtered_titles AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND kt.kind IN ('tv series',
                   'video game',
                   'video movie'))
SELECT COUNT(*)
FROM filtered_titles ft
JOIN cast_info AS ci ON ft.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_info AS mi1 ON ft.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON ft.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE rt.role IN ('director',
                   'production designer')
  AND (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND it1.id IN ('3')
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
  AND it2.id IN ('7')
  AND mi2.info IN ('LAB:Rank Film Laboratories, Denham, UK',
                    'PCS:CinemaScope',
                    'PCS:Spherical',
                    'PFM:16 mm',
                    'PFM:70 mm',
                    'RAT:4:3');