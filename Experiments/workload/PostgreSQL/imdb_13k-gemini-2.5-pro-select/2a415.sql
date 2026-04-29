 
 WITH candidate_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'video movie') INTERSECT SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   WHERE it1.id IN ('4')
     AND mi1.info IN ('Croatian',
                    'English',
                    'French',
                    'Italian',
                    'Mandarin',
                    'Romanian',
                    'Spanish',
                    'Yoruba') INTERSECT SELECT mi2.movie_id
   FROM movie_info AS mi2
   JOIN info_type AS it2 ON mi2.info_type_id = it2.id
   WHERE it2.id IN ('8')
     AND mi2.info IN ('Colombia',
                    'Croatia',
                    'Cuba',
                    'Germany',
                    'Nigeria',
                    'Romania',
                    'South Africa',
                    'Switzerland',
                    'Taiwan',
                    'USA') INTERSECT SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IS NULL
     AND rt.role IN ('director') INTERSECT SELECT mk.movie_id
   FROM movie_keyword AS mk
   JOIN keyword AS k ON mk.keyword_id = k.id)
SELECT SUM(
             (SELECT COUNT(*)
              FROM movie_info AS mi1
              JOIN info_type AS it1 ON mi1.info_type_id = it1.id
              WHERE mi1.movie_id = cm.id
                AND it1.id IN ('4')
                AND mi1.info IN ('Croatian',
                    'English',
                    'French',
                    'Italian',
                    'Mandarin',
                    'Romanian',
                    'Spanish',
                    'Yoruba')) *
             (SELECT COUNT(*)
              FROM movie_info AS mi2
              JOIN info_type AS it2 ON mi2.info_type_id = it2.id
              WHERE mi2.movie_id = cm.id
                AND it2.id IN ('8')
                AND mi2.info IN ('Colombia',
                    'Croatia',
                    'Cuba',
                    'Germany',
                    'Nigeria',
                    'Romania',
                    'South Africa',
                    'Switzerland',
                    'Taiwan',
                    'USA')) *
             (SELECT COUNT(*)
              FROM cast_info AS ci
              JOIN name AS n ON ci.person_id = n.id
              JOIN role_type AS rt ON ci.role_id = rt.id
              WHERE ci.movie_id = cm.id
                AND n.gender IS NULL
                AND rt.role IN ('director')) *
             (SELECT COUNT(*)
              FROM movie_keyword AS mk
              JOIN keyword AS k ON mk.keyword_id = k.id
              WHERE mk.movie_id = cm.id))
FROM candidate_movies AS cm;