
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1990 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'video movie')) AS t_filtered
JOIN
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('2')
     AND mi.info IN ('Color')) AS mi1_filtered ON t_filtered.id = mi1_filtered.movie_id
JOIN
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('16')
     AND mi.info IN ('USA:2002',
                    'USA:2003',
                    'USA:2005',
                    'USA:2006',
                    'USA:2007',
                    'USA:2008',
                    'USA:2009',
                    'USA:2010',
                    'USA:2011',
                    'USA:2012')) AS mi2_filtered ON t_filtered.id = mi2_filtered.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info ci
   JOIN role_type rt ON ci.role_id = rt.id
   JOIN name n ON ci.person_id = n.id
   WHERE rt.role IN ('composer')
     AND n.gender IN ('m')) AS ci_filtered ON t_filtered.id = ci_filtered.movie_id
JOIN
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('bare-chested-male',
                     'based-on-play',
                     'cigarette-smoking',
                     'dancing',
                     'doctor',
                     'family-relationships',
                     'female-nudity',
                     'fight',
                     'friendship',
                     'independent-film',
                     'jealousy',
                     'male-frontal-nudity',
                     'mother-son-relationship',
                     'singing')) AS mk_filtered ON t_filtered.id = mk_filtered.movie_id;