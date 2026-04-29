WITH t_filtered AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 2015
     AND kt.kind IN ('tv movie',
                   'video game'))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE mi1.info_type_id IN ('4')
  AND mi1.info IN ('English')
  AND mi2.info_type_id IN ('105')
  AND mi2.info IN ('$1,000,000',
                    '$100,000',
                    '$15,000',
                    '$2,000',
                    '$200,000',
                    '$250,000',
                    '$5,000')
  AND n.gender IN ('m')
  AND rt.role IN ('actor',
                   'writer')
  AND k.keyword IN ('character-name-in-title',
                     'gun',
                     'hardcore',
                     'hospital',
                     'interview',
                     'jealousy',
                     'lesbian-sex',
                     'male-frontal-nudity',
                     'marriage',
                     'mother-daughter-relationship',
                     'new-york-city',
                     'police',
                     'sex',
                     'singer',
                     'singing');