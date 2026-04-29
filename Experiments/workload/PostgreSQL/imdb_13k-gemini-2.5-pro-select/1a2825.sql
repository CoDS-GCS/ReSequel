
SELECT COUNT(*)
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
  AND it1.id IN ('17')
  AND it2.id IN ('16')
  AND t.kind_id = kt.id
  AND ci.person_id = n.id
  AND ci.role_id = rt.id
  AND mi1.info IN ('Despite the fact that this was filmed in Super 35, "Filmed in Panavision" is listed in the end credits.',
                    'Last show of the series.',
                    'Not screened for critics.',
                    'Not screened in advance for critics.',
                    'Premiere voted this movie as one of "The 50 Greatest Comedies Of All Time" in 2006.',
                    'This film is considered an "Ozploitation" (Australian exploitation) picture.')
  AND mi2.info IN ('Canada:5 February 2011',
                    'France:October 1997',
                    'Peru:1989',
                    'USA:2008',
                    'USA:8 December 2012')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game')
  AND rt.role IN ('editor')
  AND (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND t.production_year BETWEEN 1975 AND 2015;