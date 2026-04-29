WITH t_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND kt.kind IN ('tv series',
                   'video game',
                   'video movie'))
SELECT COUNT(*)
FROM t_filtered
JOIN movie_info AS mi1 ON t_filtered.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t_filtered.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t_filtered.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t_filtered.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE it1.id IN ('3')
  AND mi1.info IN ('Adventure',
                    'Biography',
                    'Comedy',
                    'Crime',
                    'Documentary',
                    'Drama',
                    'Mystery',
                    'Romance',
                    'Short',
                    'Sport')
  AND it2.id IN ('8')
  AND mi2.info IN ('Argentina',
                    'Brazil',
                    'Finland',
                    'France',
                    'Germany',
                    'Italy',
                    'Japan',
                    'Turkey',
                    'UK',
                    'USA',
                    'Yugoslavia')
  AND rt.role IN ('editor')
  AND n.gender IS NULL
  AND k.keyword IN ('dog',
                     'father-son-relationship',
                     'female-frontal-nudity',
                     'fight',
                     'revenge',
                     'singer');