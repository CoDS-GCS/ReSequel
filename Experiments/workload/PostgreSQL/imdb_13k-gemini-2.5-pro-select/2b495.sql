
SELECT COUNT(*)
FROM
  (SELECT mk.movie_id
   FROM keyword AS k
   JOIN movie_keyword AS mk ON k.id = mk.keyword_id
   WHERE k.keyword IN ('animal-sex',
                     'cobbler',
                     'colortone-musical',
                     'eating-a-rat',
                     'gala',
                     'hanged-boy',
                     'katrina',
                     'lucky-pen',
                     'revolutionary-war',
                     'street-kid',
                     'tarik-akan',
                     'turning-back-time',
                     'weekly-elimination',
                     'year-440')) AS filtered_mk
JOIN title AS t ON filtered_mk.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND kt.kind IN ('tv series',
                   'video game',
                   'video movie')
  AND it1.id IN ('7')
  AND mi1.info IN ('MET:900 m',
                    'OFM:35 mm',
                    'PCS:CinemaScope',
                    'PCS:Panavision',
                    'PCS:Spherical',
                    'PFM:35 mm',
                    'RAT:1.20 : 1',
                    'RAT:1.37 : 1',
                    'RAT:1.66 : 1',
                    'RAT:2.35 : 1')
  AND it2.id IN ('4')
  AND mi2.info IN ('Czech',
                    'English',
                    'Hungarian',
                    'Japanese',
                    'Mandarin',
                    'Portuguese',
                    'Russian',
                    'Swedish')
  AND rt.role IN ('actor',
                   'editor')
  AND (n.gender IN ('m')
       OR n.gender IS NULL);