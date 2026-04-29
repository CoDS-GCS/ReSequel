
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t,
        kind_type AS kt,
        info_type AS it1,
        movie_info AS mi1,
        movie_info AS mi2,
        info_type AS it2,
        cast_info AS ci,
        role_type AS rt,
        name AS n
   WHERE t.id = ci.movie_id
     AND t.id = mi1.movie_id
     AND t.id = mi2.movie_id
     AND mi1.info_type_id = it1.id
     AND mi2.info_type_id = it2.id
     AND t.kind_id = kt.id
     AND ci.person_id = n.id
     AND ci.role_id = rt.id
     AND it1.id IN ('3')
     AND it2.id IN ('4')
     AND mi1.info IN ('Action',
                    'Mystery',
                    'Short',
                    'Sport',
                    'Thriller')
     AND mi2.info IN ('Albanian',
                    'Bulgarian',
                    'Cantonese',
                    'Danish',
                    'English',
                    'Georgian',
                    'German',
                    'Greek',
                    'Hindi',
                    'Italian',
                    'Japanese',
                    'Polish',
                    'Portuguese',
                    'Romanian',
                    'Turkish')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
     AND rt.role IN ('editor')
     AND n.gender IS NULL
     AND t.production_year BETWEEN 1875 AND 1975) AS subquery;