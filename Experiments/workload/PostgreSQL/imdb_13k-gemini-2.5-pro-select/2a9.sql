 
 WITH candidate_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie') INTERSECT SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   WHERE it1.id IN ('7')
     AND mi1.info IN ('LAB:Technicolor',
                    'OFM:16 mm',
                    'OFM:35 mm',
                    'OFM:Live',
                    'OFM:Video',
                    'PCS:Spherical',
                    'PFM:35 mm',
                    'PFM:Video',
                    'RAT:1.33 : 1') INTERSECT SELECT mi2.movie_id
   FROM movie_info AS mi2
   JOIN info_type AS it2 ON mi2.info_type_id = it2.id
   WHERE it2.id IN ('2')
     AND mi2.info IN ('Black and White',
                    'Color') INTERSECT SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IS NULL
     AND rt.role IN ('costume designer') INTERSECT SELECT mk.movie_id
   FROM movie_keyword AS mk
   JOIN keyword AS k ON mk.keyword_id = k.id)
SELECT SUM(
             (SELECT COUNT(*)
              FROM movie_info AS mi1
              JOIN info_type AS it1 ON mi1.info_type_id = it1.id
              WHERE mi1.movie_id = cm.id
                AND it1.id IN ('7')
                AND mi1.info IN ('LAB:Technicolor',
                    'OFM:16 mm',
                    'OFM:35 mm',
                    'OFM:Live',
                    'OFM:Video',
                    'PCS:Spherical',
                    'PFM:35 mm',
                    'PFM:Video',
                    'RAT:1.33 : 1')) *
             (SELECT COUNT(*)
              FROM movie_info AS mi2
              JOIN info_type AS it2 ON mi2.info_type_id = it2.id
              WHERE mi2.movie_id = cm.id
                AND it2.id IN ('2')
                AND mi2.info IN ('Black and White',
                    'Color')) *
             (SELECT COUNT(*)
              FROM cast_info AS ci
              JOIN name AS n ON ci.person_id = n.id
              JOIN role_type AS rt ON ci.role_id = rt.id
              WHERE ci.movie_id = cm.id
                AND n.gender IS NULL
                AND rt.role IN ('costume designer')) *
             (SELECT COUNT(*)
              FROM movie_keyword AS mk
              JOIN keyword AS k ON mk.keyword_id = k.id
              WHERE mk.movie_id = cm.id))
FROM candidate_movies AS cm;