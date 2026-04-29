
SELECT COUNT(*)
FROM title AS t
INNER JOIN kind_type AS kt ON t.kind_id = kt.id
INNER JOIN movie_info AS mi1 ON t.id = mi1.movie_id
INNER JOIN info_type AS it1 ON mi1.info_type_id = it1.id
INNER JOIN movie_info AS mi2 ON t.id = mi2.movie_id
INNER JOIN info_type AS it2 ON mi2.info_type_id = it2.id
INNER JOIN cast_info AS ci ON t.id = ci.movie_id
INNER JOIN name AS n ON ci.person_id = n.id
INNER JOIN role_type AS rt ON ci.role_id = rt.id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND t.title IN ('(#1.37)',
                   '(#1.76)',
                   '(#4.4)',
                   'Branded',
                   'Meet Danny Wilson',
                   'Sweet Charity',
                   'The Black Widow',
                   'The Buccaneer',
                   'The Coward',
                   'The Desert Hawk',
                   'The Gunman',
                   'The Hunchback of Notre Dame',
                   'Too Hot to Handle',
                   'Triple Cross')
  AND kt.kind IN ('movie',
                   'tv movie',
                   'video game')
  AND it1.id IN ('7')
  AND mi1.info IN ('LAB:Laboratoires Éclair, Paris, France',
                    'LAB:Technicolor, Hollywood (CA), USA',
                    'PCS:Techniscope',
                    'PCS:VistaVision',
                    'PFM:16 mm',
                    'PFM:Video',
                    'RAT:1.20 : 1',
                    'RAT:1.78 : 1',
                    'RAT:1.85 : 1',
                    'RAT:2.20 : 1',
                    'RAT:2.35 : 1')
  AND it2.id IN ('5')
  AND mi2.info IN ('Argentina:13',
                    'Australia:M',
                    'Belgium:KT',
                    'Finland:K-12',
                    'Finland:K-8',
                    'France:-12',
                    'France:U',
                    'Sweden:11',
                    'USA:Approved',
                    'USA:R',
                    'USA:X')
  AND rt.role IN ('guest',
                   'production designer',
                   'writer')
  AND (n.gender IN ('m')
       OR n.gender IS NULL);