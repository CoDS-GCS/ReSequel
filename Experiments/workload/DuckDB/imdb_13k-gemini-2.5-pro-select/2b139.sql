WITH t_filtered AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'video movie')),
     mi1_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('18')
     AND mi.info IN ('Baltimore, Maryland, USA',
                    'Budapest, Hungary',
                    'Burbank, California, USA',
                    'Cologne, North Rhine - Westphalia, Germany',
                    'Florida, USA',
                    'New Jersey, USA',
                    'Orlando, Florida, USA',
                    'Spain',
                    'Stage 10, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Stage 25, Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Vienna, Austria',
                    'Winnipeg, Manitoba, Canada')),
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
   WHERE rt.role IN ('cinematographer',
                   'production designer')
     AND n.gender IN ('f',
                    'm')),
     mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('anal-sex',
                     'based-on-play',
                     'doctor',
                     'dog',
                     'father-son-relationship',
                     'female-nudity',
                     'husband-wife-relationship',
                     'interview',
                     'jealousy',
                     'lesbian-sex',
                     'love',
                     'marriage',
                     'murder',
                     'nudity',
                     'sequel',
                     'surrealism',
                     'tv-mini-series',
                     'violence'))
SELECT COUNT(*)
FROM t_filtered t
JOIN mi1_filtered mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered mi2 ON t.id = mi2.movie_id
JOIN ci_filtered ci ON t.id = ci.movie_id
JOIN mk_filtered mk ON t.id = mk.movie_id;