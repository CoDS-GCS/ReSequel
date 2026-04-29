WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1950 AND 1990
     AND title IN ('(#1.166)',
                   '(#1.178)',
                   '(#1.244)',
                   '(#1.273)',
                   '(#1.33)',
                   '(#1.427)',
                   '(#1.483)',
                   '(#1.587)',
                   '(#1.717)',
                   '(#1.876)',
                   '(#1.99)',
                   '(#11.1)',
                   '(#2.15)',
                   '(#6.14)',
                   'Angustia',
                   'Babes in Toyland',
                   'Dead End',
                   'Der Hauptmann von Köpenick',
                   'Ein Kapitel für sich',
                   'Endgame',
                   'Family Affair',
                   'Fire Down Below',
                   'Higher Education',
                   'Hochzeit mit Hindernissen',
                   'Kraj rata',
                   'Legacy',
                   'Lorenzaccio',
                   'Mantrap',
                   'Miyamoto Musashi',
                   'New York Stories',
                   'Poor Little Rich Girl',
                   'Rain',
                   'Rebellion',
                   'Return',
                   'Robbery',
                   'Run for the Money',
                   'Spare the Rod',
                   'Starrcade',
                   'Stephen',
                   'TV or Not TV',
                   'The 42nd Annual Primetime Emmy Awards',
                   'The Godfather: Part III',
                   'The Heiress',
                   'The Little Mermaid',
                   'The Proposal',
                   'The Silent Partner',
                   'They Call Me Bruce?')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'editor'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('7')
  AND mi2.info_type_id IN ('8')
  AND mi1.info IN ('LAB:Boyana Film Laboratory, Sofia, Bulgaria',
                    'LAB:Movielab, USA',
                    'PCS:Tohoscope',
                    'PFM:Video',
                    'RAT:1.85 : 1',
                    'RAT:2.20 : 1')
  AND mi2.info IN ('Albania',
                    'Belgium',
                    'Canada',
                    'Hungary',
                    'Iran',
                    'Israel',
                    'Italy',
                    'Mexico',
                    'Netherlands',
                    'Soviet Union',
                    'Spain',
                    'USA');