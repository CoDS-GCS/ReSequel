
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game')
  AND it1.id IN ('17')
  AND mi1.info IN ('Despite the fact that this was filmed in Super 35, "Filmed in Panavision" is listed in the end credits.',
                    'Last show of the series.',
                    'Not screened for critics.',
                    'Not screened in advance for critics.',
                    'Premiere voted this movie as one of "The 50 Greatest Comedies Of All Time" in 2006.',
                    'This film is considered an "Ozploitation" (Australian exploitation) picture.')
  AND it2.id IN ('16')
  AND mi2.info IN ('Canada:5 February 2011',
                    'France:October 1997',
                    'Peru:1989',
                    'USA:2008',
                    'USA:8 December 2012')
  AND rt.role IN ('editor')
  AND (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL);