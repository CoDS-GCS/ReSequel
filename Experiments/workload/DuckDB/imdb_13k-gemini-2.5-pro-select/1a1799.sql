WITH filtered_t AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year <= 2015
     AND t.production_year > 1990
     AND kt.kind IN ('movie',
                  'video movie'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE mi1.info_type_id = '8'
  AND mi1.info IN ('Austria',
                   'Belgium',
                   'China',
                   'Hungary',
                   'Indonesia',
                   'Israel',
                   'Spain',
                   'Switzerland',
                   'USA')
  AND mi2.info_type_id = '4'
  AND mi2.info IN ('English',
                   'Galician',
                   'German',
                   'Indonesian',
                   'Italian',
                   'Japanese',
                   'None')
  AND rt.role IN ('production designer')
  AND n.gender IN ('f');