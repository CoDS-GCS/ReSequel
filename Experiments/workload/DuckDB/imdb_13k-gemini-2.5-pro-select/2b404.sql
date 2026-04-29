
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1990 AND 2015
     AND kt.kind IN ('movie',
                   'video movie')) AS t_filtered
JOIN
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('7')
     AND mi.info IN ('OFM:35 mm',
                    'PCS:Digital Intermediate',
                    'PCS:Spherical',
                    'PFM:35 mm',
                    'PFM:D-Cinema',
                    'RAT:1.33 : 1',
                    'RAT:16:9 HD',
                    'RAT:2.35 : 1')) AS mi1_filtered ON t_filtered.id = mi1_filtered.movie_id
JOIN
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('5')
     AND mi.info IN ('Argentina:13',
                    'Australia:PG',
                    'France:U',
                    'Ireland:15A',
                    'Italy:T',
                    'New Zealand:R18',
                    'Peru:PT',
                    'Portugal:M/12',
                    'Singapore:M18',
                    'South Korea:All',
                    'Switzerland:14',
                    'UK:PG',
                    'USA:TV-PG')) AS mi2_filtered ON t_filtered.id = mi2_filtered.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info ci
   JOIN role_type rt ON ci.role_id = rt.id
   JOIN name n ON ci.person_id = n.id
   WHERE rt.role IN ('composer')
     AND n.gender IN ('f')) AS ci_filtered ON t_filtered.id = ci_filtered.movie_id
JOIN
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('crabbiness',
                     'drinking-competition',
                     'eating-off-a-table-top',
                     'failing-student',
                     'family-computer-disk-system',
                     'forgotten-birthday',
                     'indian-classical-music',
                     'leg-blown-off',
                     'passport',
                     'porto',
                     'restraining-strap',
                     'romanian-revolution',
                     'san-quentin',
                     'singing-to-self',
                     'slow-motion-carnage',
                     'stenography-school',
                     'voodoo-queen')) AS mk_filtered ON t_filtered.id = mk_filtered.movie_id;