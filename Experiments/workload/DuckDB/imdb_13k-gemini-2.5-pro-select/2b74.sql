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
   WHERE mi.info_type_id IN ('16')
     AND mi.info IN ('USA:2003',
                    'USA:2004',
                    'USA:2006',
                    'USA:2008',
                    'USA:2009',
                    'USA:2010',
                    'USA:2012')),
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
   WHERE k.keyword IN ('anal-sex',
                     'bare-chested-male',
                     'based-on-novel',
                     'blood',
                     'cigarette-smoking',
                     'dancing',
                     'death',
                     'fight',
                     'flashback',
                     'friendship',
                     'independent-film',
                     'jealousy',
                     'love',
                     'non-fiction',
                     'number-in-title',
                     'party',
                     'police',
                     'sequel',
                     'sex',
                     'surrealism'))
SELECT COUNT(*)
FROM t_filtered t
JOIN mi1_filtered mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered mi2 ON t.id = mi2.movie_id
JOIN ci_filtered ci ON t.id = ci.movie_id
JOIN mk_filtered mk ON t.id = mk.movie_id;