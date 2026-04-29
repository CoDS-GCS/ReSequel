
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')) AS t_filtered
JOIN
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('1')
     AND mi.info IN ('10',
                    '30',
                    '6',
                    '70',
                    'USA:10',
                    'USA:20',
                    'USA:30',
                    'USA:50',
                    'USA:60')) AS mi1_filtered ON t_filtered.id = mi1_filtered.movie_id
JOIN
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('8')
     AND mi.info IN ('USA')) AS mi2_filtered ON t_filtered.id = mi2_filtered.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info ci
   JOIN role_type rt ON ci.role_id = rt.id
   JOIN name n ON ci.person_id = n.id
   WHERE rt.role IN ('miscellaneous crew')
     AND n.gender IN ('m')) AS ci_filtered ON t_filtered.id = ci_filtered.movie_id
JOIN
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('bare-chested-male',
                     'based-on-play',
                     'blood',
                     'father-son-relationship',
                     'female-nudity',
                     'fight',
                     'homosexual',
                     'husband-wife-relationship',
                     'independent-film',
                     'marriage',
                     'murder',
                     'new-york-city',
                     'nudity',
                     'number-in-title',
                     'oral-sex',
                     'party',
                     'sequel',
                     'singing',
                     'surrealism')) AS mk_filtered ON t_filtered.id = mk_filtered.movie_id;