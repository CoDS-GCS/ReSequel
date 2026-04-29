
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'video movie')) AS t_filtered
JOIN
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('1')
     AND mi.info IN ('11',
                    '21',
                    '29',
                    '50',
                    'UK:30',
                    'UK:60',
                    'USA:11')) AS mi1_filtered ON t_filtered.id = mi1_filtered.movie_id
JOIN
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('2')
     AND mi.info IN ('Color')) AS mi2_filtered ON t_filtered.id = mi2_filtered.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info ci
   JOIN role_type rt ON ci.role_id = rt.id
   JOIN name n ON ci.person_id = n.id
   WHERE rt.role IN ('producer')
     AND n.gender IN ('m')) AS ci_filtered ON t_filtered.id = ci_filtered.movie_id
JOIN
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('based-on-play',
                     'dancing',
                     'doctor',
                     'father-son-relationship',
                     'fight',
                     'flashback',
                     'gun',
                     'homosexual',
                     'husband-wife-relationship',
                     'interview',
                     'kidnapping',
                     'lesbian-sex',
                     'marriage',
                     'mother-son-relationship',
                     'non-fiction',
                     'nudity',
                     'number-in-title',
                     'sequel',
                     'sex',
                     'singing',
                     'song',
                     'suicide')) AS mk_filtered ON t_filtered.id = mk_filtered.movie_id;