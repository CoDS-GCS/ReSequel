WITH mi1_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('3')
     AND mi.info IN ('Comedy',
                    'Drama')),
     mi2_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('5')
     AND mi.info IN ('Canada:G',
                    'India:U',
                    'Singapore:PG',
                    'South Korea:15'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN mi1_filtered mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND rt.role IN ('miscellaneous crew')
  AND n.gender IN ('m')
  AND k.keyword IN ('afraid-to-love',
                     'battleship',
                     'breaking-dish',
                     'carbon-tetrachloride',
                     'cbc-radio',
                     'disguise',
                     'displacement-camp',
                     'english-folk-song',
                     'field-dressing',
                     'hezbollah',
                     'hydraulics',
                     'implant-rejection',
                     'invisibility-spray',
                     'magical-artifact',
                     'motorcycle-off-cliff',
                     'multilingual',
                     'oral-history',
                     'plant-database',
                     'plymouth-england',
                     'roosevelt-high-school-seattle-washington',
                     'sex-drive',
                     'wieniawski-competition-poznan');