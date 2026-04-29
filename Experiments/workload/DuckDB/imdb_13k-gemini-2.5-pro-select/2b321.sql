WITH t_filtered AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1990 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'video movie')),
     mi1_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('5')
     AND mi.info IN ('Brazil:12',
                    'Canada:18A',
                    'Finland:K-11',
                    'Finland:K-16',
                    'Finland:K-7',
                    'Hong Kong:III',
                    'Ireland:12A',
                    'Mexico:B',
                    'New Zealand:M',
                    'Peru:PT',
                    'Philippines:G',
                    'Switzerland:10',
                    'Switzerland:14',
                    'USA:M')),
     mi2_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('2')
     AND mi.info IN ('Color')),
     ci_filtered AS
  (SELECT ci.movie_id
   FROM cast_info ci
   JOIN role_type rt ON ci.role_id = rt.id
   JOIN name n ON ci.person_id = n.id
   WHERE rt.role IN ('cinematographer')
     AND n.gender IN ('f')),
     mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('cooking-competition',
                     'fake-artifact',
                     'future-without-prospect',
                     'greyhound',
                     'isolated-place',
                     'payne-ohio',
                     'reference-to-dion-charles-obanyon',
                     'reference-to-jim-webb',
                     'reference-to-montana-lance',
                     'secret-escape-chute',
                     'woman-without-head'))
SELECT COUNT(*)
FROM t_filtered t
JOIN mi1_filtered mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered mi2 ON t.id = mi2.movie_id
JOIN ci_filtered ci ON t.id = ci.movie_id
JOIN mk_filtered mk ON t.id = mk.movie_id;