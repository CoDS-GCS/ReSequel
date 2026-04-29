 
 WITH cast_counts AS
  (SELECT ci.movie_id,
          count(*) AS num_casts
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   JOIN name AS n ON ci.person_id = n.id
   WHERE rt.role IN ('composer',
                   'costume designer')
     AND (n.gender IN ('m')
          OR n.gender IS NULL)
   GROUP BY ci.movie_id),
     info1_counts AS
  (SELECT mi1.movie_id,
          count(*) AS num_info1
   FROM movie_info AS mi1
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   WHERE it1.id IN ('16')
     AND mi1.info IN ('Nigeria:2007',
                    'Nigeria:2008',
                    'USA:1954',
                    'USA:1989',
                    'USA:1994',
                    'USA:2000',
                    'USA:2001',
                    'USA:2002',
                    'USA:2003',
                    'USA:2005',
                    'USA:2009',
                    'USA:2010',
                    'USA:2012',
                    'USA:June 2009',
                    'USA:May 2009')
   GROUP BY mi1.movie_id),
     info2_counts AS
  (SELECT mi2.movie_id,
          count(*) AS num_info2
   FROM movie_info AS mi2
   JOIN info_type AS it2 ON mi2.info_type_id = it2.id
   WHERE it2.id IN ('4')
     AND mi2.info IN ('Armenian',
                    'Cantonese',
                    'Danish',
                    'Lithuanian',
                    'Marathi')
   GROUP BY mi2.movie_id)
SELECT SUM(cc.num_casts * i1c.num_info1 * i2c.num_info2)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_counts AS cc ON t.id = cc.movie_id
JOIN info1_counts AS i1c ON t.id = i1c.movie_id
JOIN info2_counts AS i2c ON t.id = i2c.movie_id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie');