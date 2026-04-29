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
   WHERE mi.info_type_id IN ('6')
     AND mi.info IN ('DTS',
                    'Dolby Digital',
                    'Dolby',
                    'Mono',
                    'SDDS',
                    'Stereo')),
     mi2_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('5')
     AND mi.info IN ('Brazil:14',
                    'Canada:18A',
                    'Germany:16',
                    'Hong Kong:IIA',
                    'Iceland:12',
                    'Iceland:16',
                    'Malaysia:U',
                    'Netherlands:16',
                    'Peru:14',
                    'Singapore:PG',
                    'Sweden:11',
                    'Sweden:Btl',
                    'UK:18',
                    'USA:TV-PG',
                    'West Germany:12')),
     ci_filtered AS
  (SELECT ci.movie_id
   FROM cast_info ci
   JOIN role_type rt ON ci.role_id = rt.id
   JOIN name n ON ci.person_id = n.id
   WHERE rt.role IN ('costume designer',
                   'production designer')
     AND n.gender IN ('f')),
     mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('antigravity-belt',
                     'arena-cage',
                     'basilosaurus',
                     'changing-past-event',
                     'child-safety',
                     'criminal-defense',
                     'delicacy',
                     'ear-canal',
                     'girl-leaves-boy',
                     'gumball',
                     'hidden-lock',
                     'milk-cart',
                     'neck-flip',
                     'nurse-patient-sex',
                     'reference-to-marlo-thomas',
                     'smith',
                     'sound-woman',
                     'speak',
                     'special-hearing-board',
                     'stairwell',
                     'stone-tool',
                     'targeting-children',
                     'visible-thong-straps',
                     'wooden-cross',
                     'yellow-eyes'))
SELECT COUNT(*)
FROM t_filtered t
JOIN mi1_filtered mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered mi2 ON t.id = mi2.movie_id
JOIN ci_filtered ci ON t.id = ci.movie_id
JOIN mk_filtered mk ON t.id = mk.movie_id;