WITH t_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year >= 1925
     AND t.production_year <= 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'video movie')),
     mi_combined AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN movie_info AS mi2 ON mi1.movie_id = mi2.movie_id
   WHERE mi1.info_type_id IN ('5')
     AND mi1.info IN ('Argentina:Atp',
                    'Australia:MA',
                    'Canada:18A',
                    'Canada:G',
                    'Finland:K-12',
                    'Finland:K-18',
                    'Iceland:16',
                    'Norway:15',
                    'Norway:16',
                    'Philippines:PG-13',
                    'Portugal:M/16',
                    'Sweden:15',
                    'USA:G',
                    'USA:Not Rated',
                    'West Germany:12')
     AND mi2.info_type_id IN ('4')
     AND mi2.info IN ('English',
                    'French',
                    'German',
                    'Spanish')),
     mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword AS mk
   JOIN keyword AS k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('blast-furnace',
                     'caribou',
                     'forced-conversion',
                     'pity',
                     'playground-spinning-wheel',
                     'promiscuity')),
     ci_filtered AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IS NULL
     AND rt.role IN ('production designer'))
SELECT COUNT(*)
FROM t_filtered t
JOIN mi_combined mi ON t.id = mi.movie_id
JOIN mk_filtered mk ON t.id = mk.movie_id
JOIN ci_filtered ci ON t.id = ci.movie_id;