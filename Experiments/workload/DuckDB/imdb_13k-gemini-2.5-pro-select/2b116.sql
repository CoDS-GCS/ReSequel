WITH t_filtered AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'video movie')),
     mi1_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('4')
     AND mi.info IN ('English',
                    'Filipino',
                    'French',
                    'German',
                    'Portuguese')),
     mi2_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('5')
     AND mi.info IN ('Argentina:13',
                    'Finland:K-16',
                    'New Zealand:PG',
                    'Norway:11',
                    'Philippines:R-18',
                    'Portugal:M/12',
                    'UK:12A',
                    'UK:X',
                    'USA:E',
                    'USA:R')),
     ci_filtered AS
  (SELECT ci.movie_id
   FROM cast_info ci
   JOIN role_type rt ON ci.role_id = rt.id
   JOIN name n ON ci.person_id = n.id
   WHERE rt.role IN ('editor')
     AND n.gender IN ('m')),
     mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('blouse-ripped-open',
                     'burying-a-dead-bird',
                     'drug-reference',
                     'endowment',
                     'physics-teacher',
                     'reference-to-deng-xiaoping',
                     'reference-to-robin-williams',
                     'reference-to-vincent-price',
                     'runaway-stagecoach',
                     'sealed-record',
                     'seiniger'))
SELECT COUNT(*)
FROM t_filtered t
JOIN mi1_filtered mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered mi2 ON t.id = mi2.movie_id
JOIN ci_filtered ci ON t.id = ci.movie_id
JOIN mk_filtered mk ON t.id = mk.movie_id;