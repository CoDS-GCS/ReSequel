WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 2015
     AND t.title IN ('(#1.9665)',
                   '(#1.994)',
                   '(#16.9)',
                   '(2004-10-18)',
                   '(2006-07-16)',
                   '(2010-02-13)',
                   '(2010-05-13)',
                   '54',
                   'Bakit di totohanin',
                   'Camelot',
                   'Can We Do This?',
                   'Congo',
                   'Crossfire',
                   'Dancin Homer',
                   'Defiance',
                   'Dolly',
                   'Familiesagaen de syv søstre',
                   'Feels Like Rain',
                   'Folge 11',
                   'George Whites Scandals',
                   'Happy Birthday 2 You',
                   'Herbie Fully Loaded',
                   'Hit',
                   'In the Still of the Night',
                   'La decisión',
                   'Little White Lies',
                   'Points',
                   'Rivales',
                   'Scream 4',
                   'St. Trinians',
                   'The Beastmaster',
                   'The Contender',
                   'The Hoodlum Saint',
                   'The Ring Two',
                   'The Rose',
                   'Top 11 Perform',
                   'Vertrauensbruch')
     AND kt.kind IN ('movie',
                   'tv series',
                   'video game',
                   'video movie'))
SELECT COUNT(*)
FROM filtered_movies AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE n.gender IN ('m')
  AND rt.role IN ('costume designer',
                   'writer')
  AND it1.id IN ('2')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND it2.id IN ('7')
  AND mi2.info IN ('CAM:Canon XL-1',
                    'CAM:Panaflex Camera and Lenses by Panavision',
                    'CAM:Panasonic AG-DVX100',
                    'CAM:Panasonic AG-HVX200',
                    'LAB:Boyana Film Laboratory, Sofia, Bulgaria',
                    'LAB:FotoKem Laboratory, Burbank (CA), USA',
                    'LAB:Technicolor, USA',
                    'OFM:8 mm',
                    'OFM:Live',
                    'OFM:Redcode RAW',
                    'PFM:16 mm',
                    'RAT:1.33 : 1',
                    'RAT:16:9 HD');