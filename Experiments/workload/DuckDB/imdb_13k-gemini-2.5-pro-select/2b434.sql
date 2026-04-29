WITH t_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year >= 1990
     AND t.production_year <= 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'video movie')),
     mi1_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('105')
     AND info IN ('$1,000',
                    '$1,000,000',
                    '$10,000',
                    '$100,000',
                    '$15,000',
                    '$2,000',
                    '$20,000',
                    '$25,000',
                    '$250,000',
                    '$3,000',
                    '$30,000',
                    '$5,000',
                    '$500,000')),
     mi2_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('8')
     AND info IN ('USA')),
     mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword AS mk
   JOIN keyword AS k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('dog',
                     'father-daughter-relationship',
                     'female-frontal-nudity',
                     'hospital',
                     'husband-wife-relationship',
                     'male-nudity',
                     'new-york-city',
                     'one-word-title')),
     ci_filtered AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IS NULL
     AND rt.role IN ('director',
                   'writer'))
SELECT COUNT(*)
FROM t_filtered t
JOIN ci_filtered ci ON t.id = ci.movie_id
JOIN mk_filtered mk ON t.id = mk.movie_id
JOIN mi1_filtered mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered mi2 ON t.id = mi2.movie_id;