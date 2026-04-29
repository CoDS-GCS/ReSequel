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
   WHERE mi.info_type_id IN ('4')
     AND mi.info IN ('Dutch',
                    'English',
                    'French',
                    'Italian',
                    'Spanish')),
     mi2_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('6')
     AND mi.info IN ('Dolby Digital',
                    'Dolby SR',
                    'Dolby',
                    'Mono',
                    'SDDS',
                    'Stereo')),
     ci_filtered AS
  (SELECT ci.movie_id
   FROM cast_info ci
   JOIN role_type rt ON ci.role_id = rt.id
   JOIN name n ON ci.person_id = n.id
   WHERE rt.role IN ('director')
     AND n.gender IN ('f')),
     mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('30s-cartoon',
                     'automation',
                     'bisexual',
                     'bus-massacre',
                     'chateauroux-france',
                     'cutting-vegetable',
                     'cylon',
                     'debate-coach',
                     'eating-paint',
                     'el-uvero-cuba',
                     'false-passport',
                     'firewalker',
                     'frogger',
                     'lazarus',
                     'man-monster-fight',
                     'medical-supplies',
                     'middle-eastern-food',
                     'model-husband',
                     'native-american-medicine',
                     'stomach-pumped',
                     'survivor-guilt',
                     'thoracic-cage',
                     'u.s.-invasion-of-afghanistan'))
SELECT COUNT(*)
FROM t_filtered t
JOIN mi1_filtered mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered mi2 ON t.id = mi2.movie_id
JOIN ci_filtered ci ON t.id = ci.movie_id
JOIN mk_filtered mk ON t.id = mk.movie_id;