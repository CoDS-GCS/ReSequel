WITH t_filtered AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'video movie'))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE mi1.info_type_id IN ('3')
  AND mi1.info IN ('Comedy',
                    'Drama')
  AND mi2.info_type_id IN ('5')
  AND mi2.info IN ('Canada:G',
                    'India:U',
                    'Singapore:PG',
                    'South Korea:15')
  AND n.gender IN ('m')
  AND rt.role IN ('miscellaneous crew')
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