WITH t_filtered AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')),
     mi1_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('8')
     AND mi.info IN ('USA')),
     mi2_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('105')
     AND mi.info IN ('$1,000,000',
                    '$10,000',
                    '$100',
                    '$100,000',
                    '$15,000',
                    '$2,000',
                    '$20,000',
                    '$25,000',
                    '$250,000',
                    '$3,000',
                    '$30,000',
                    '$5,000',
                    '$50,000',
                    '$500,000')),
     ci_filtered AS
  (SELECT ci.movie_id
   FROM cast_info ci
   JOIN role_type rt ON ci.role_id = rt.id
   JOIN name n ON ci.person_id = n.id
   WHERE rt.role IN ('cinematographer',
                   'editor')
     AND n.gender IN ('f',
                    'm')),
     mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('anal-sex',
                     'bare-chested-male',
                     'dancing',
                     'doctor',
                     'father-son-relationship',
                     'homosexual',
                     'lesbian-sex',
                     'number-in-title'))
SELECT COUNT(*)
FROM t_filtered t
JOIN mi1_filtered mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered mi2 ON t.id = mi2.movie_id
JOIN ci_filtered ci ON t.id = ci.movie_id
JOIN mk_filtered mk ON t.id = mk.movie_id;