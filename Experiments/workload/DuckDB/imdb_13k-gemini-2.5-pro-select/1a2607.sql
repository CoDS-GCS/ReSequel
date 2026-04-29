WITH filtered_titles AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1990 AND 2015
     AND kt.kind IN ('movie',
                   'tv movie',
                   'video game'))
SELECT COUNT(*)
FROM filtered_titles ft
JOIN cast_info AS ci ON ft.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_info AS mi1 ON ft.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON ft.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE rt.role IN ('composer',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND it1.id IN ('18')
  AND mi1.info IN ('Agoura Hills, California, USA',
                    'Culver City, California, USA',
                    'Estudios Churubusco Azteca, Mexico City, Distrito Federal, Mexico',
                    'Lancaster, California, USA',
                    'Leipzig, Saxony, Germany',
                    'Massachusetts, USA',
                    'New York City, New York, USA',
                    'Royal Palace, Caserta, Campania, Italy',
                    'Stage 12, Universal Studios - 100 Universal City Plaza, Universal City, California, USA',
                    'Stage 43, Universal Studios - 100 Universal City Plaza, Universal City, California, USA',
                    'Studio Babelsberg, Potsdam, Brandenburg, Germany',
                    'Tower Theatre - 802 S. Broadway, Downtown, Los Angeles, California, USA',
                    'UK')
  AND it2.id IN ('16')
  AND mi2.info IN ('Australia:14 October 2004',
                    'Canada:27 September 2005',
                    'Hungary:10 April 2004',
                    'Norway:11 May 2004',
                    'Portugal:10 October 2005',
                    'Sweden:24 January 2004',
                    'USA:2004',
                    'USA:2008',
                    'USA:2009',
                    'USA:2011',
                    'USA:5 September 2001');