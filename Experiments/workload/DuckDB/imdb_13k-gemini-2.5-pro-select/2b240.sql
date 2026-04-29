WITH t_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year >= 1925
     AND t.production_year <= 2015
     AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')),
     mi_combined AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN movie_info AS mi2 ON mi1.movie_id = mi2.movie_id
   WHERE mi1.info_type_id IN ('105')
     AND mi1.info IN ('$1,000,000',
                    '$10,000',
                    '$100',
                    '$100,000',
                    '$15,000',
                    '$150,000',
                    '$2,000',
                    '$20,000',
                    '$200,000',
                    '$250,000',
                    '$30,000',
                    '$500',
                    '$500,000')
     AND mi2.info_type_id IN ('4')
     AND mi2.info IN ('English')),
     mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword AS mk
   JOIN keyword AS k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('character-name-in-title',
                     'dancing',
                     'doctor',
                     'father-son-relationship',
                     'flashback',
                     'gay',
                     'gun',
                     'hardcore',
                     'homosexual',
                     'kidnapping',
                     'lesbian',
                     'love',
                     'one-word-title',
                     'party',
                     'song',
                     'violence')),
     ci_filtered AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IS NULL
     AND rt.role IN ('cinematographer',
                   'writer'))
SELECT COUNT(*)
FROM t_filtered t
JOIN mi_combined mi ON t.id = mi.movie_id
JOIN mk_filtered mk ON t.id = mk.movie_id
JOIN ci_filtered ci ON t.id = ci.movie_id;