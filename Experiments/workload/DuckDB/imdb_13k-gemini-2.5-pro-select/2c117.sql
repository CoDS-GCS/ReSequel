
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
WHERE t.production_year BETWEEN 1925 AND 1975
  AND t.title IN ('(#1.63)',
                   '(#2.26)',
                   '(#2.45)',
                   '(#3.35)',
                   '(#4.2)',
                   '(#5.12)',
                   'A Star Is Born',
                   'Anna Christie',
                   'Bottoms Up',
                   'Death Trap',
                   'Dillinger',
                   'Duffys Tavern',
                   'Errand of Mercy',
                   'Fall Guy',
                   'French Leave',
                   'God Is My Co-Pilot',
                   'Goin to Town',
                   'High Stakes',
                   'Huckleberry Finn',
                   'Love Story',
                   'My Fair Lady',
                   'Richard II Part 2: The Deposing of a King',
                   'Richard III',
                   'Running Wild',
                   'See No Evil',
                   'Shadow of a Man',
                   'Sister Kenny',
                   'Sitting Pretty',
                   'Smart Woman',
                   'State Fair',
                   'Tales of Manhattan',
                   'The Godfather: Part II',
                   'The Informer',
                   'The Lie',
                   'The Locket',
                   'The Milkman',
                   'The Perils of Pauline',
                   'The System',
                   'The Tiger Woman',
                   'The Wrong Box',
                   'Thomas Müntzer',
                   'Threes Company',
                   'Trapped',
                   'Voyna i mir')
  AND kt.kind IN ('episode',
                   'tv series',
                   'video game',
                   'video movie')
  AND it1.id IN ('6')
  AND mi1.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'AGA Sound System',
                    'Dolby Digital',
                    'Mono',
                    'Perspecta Stereo',
                    'Stereo',
                    'Vitaphone')
  AND it2.id IN ('7')
  AND mi2.info IN ('LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                    'LAB:Technicolor',
                    'LAB:Technicolor, USA',
                    'MET:300 m',
                    'MET:600 m',
                    'OFM:Video',
                    'PCS:Spherical',
                    'PFM:70 mm',
                    'PFM:Video',
                    'RAT:1.20 : 1',
                    'RAT:1.33 : 1')
  AND rt.role IN ('composer',
                   'costume designer',
                   'production designer',
                   'writer')
  AND (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL);