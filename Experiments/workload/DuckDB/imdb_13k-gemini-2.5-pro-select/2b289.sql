
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')) AS t_filtered
JOIN
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('2')
     AND mi.info IN ('Color')) AS mi1_filtered ON t_filtered.id = mi1_filtered.movie_id
JOIN
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('1')
     AND mi.info IN ('10',
                    '15',
                    '18',
                    '2',
                    '23',
                    '30',
                    '45',
                    '60',
                    '75',
                    '91',
                    '95',
                    '97',
                    'USA:100',
                    'USA:4',
                    'USA:6')) AS mi2_filtered ON t_filtered.id = mi2_filtered.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info ci
   JOIN role_type rt ON ci.role_id = rt.id
   JOIN name n ON ci.person_id = n.id
   WHERE rt.role IN ('production designer')
     AND n.gender IN ('m')) AS ci_filtered ON t_filtered.id = ci_filtered.movie_id
JOIN
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('arm-twisted',
                     'diving--robot',
                     'flower-club',
                     'könig',
                     'land-grant-dispute',
                     'latin-american',
                     'latin-class',
                     'messenger-boy',
                     'montjuich-circuit',
                     'obihiro',
                     'reference-to-giulietta-masina',
                     'sketch-comedy',
                     'spacedisco',
                     'sympathetic-ortho-mitis',
                     'wooden-sheild')) AS mk_filtered ON t_filtered.id = mk_filtered.movie_id;