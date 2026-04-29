
SELECT COUNT(*)
FROM title AS t
WHERE t.production_year BETWEEN 1950 AND 1990
  AND t.title IN ('(#1.128)',
                   '(#1.310)',
                   '(#1.609)',
                   'Baby Blues',
                   'Death Trap',
                   'Double Exposure',
                   'Hail to the Chief',
                   'Journeys End',
                   'Living Doll',
                   'Mirror Image',
                   'Proof Positive',
                   'Star Wars: Episode VI - Return of the Jedi',
                   'The Big Day',
                   'The Pigeon',
                   'The Renegades',
                   'Vengeance')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series'))
  AND EXISTS
    (SELECT 1
     FROM movie_info AS mi1
     WHERE mi1.movie_id = t.id
       AND mi1.info_type_id IN ('7')
       AND mi1.info IN ('OFM:8 mm',
                    'OFM:Video',
                    'PCS:Dyaliscope',
                    'PFM:35 mm',
                    'RAT:2.35 : 1'))
  AND EXISTS
    (SELECT 1
     FROM movie_info AS mi2
     WHERE mi2.movie_id = t.id
       AND mi2.info_type_id IN ('8')
       AND mi2.info IN ('Argentina',
                    'Bulgaria',
                    'Iran',
                    'Italy',
                    'Mexico',
                    'Portugal',
                    'UK',
                    'West Germany'))
  AND EXISTS
    (SELECT 1
     FROM cast_info AS ci
     JOIN name AS n ON ci.person_id = n.id
     JOIN role_type AS rt ON ci.role_id = rt.id
     WHERE ci.movie_id = t.id
       AND rt.role IN ('costume designer',
                   'director',
                   'guest')
       AND (n.gender IN ('f')
            OR n.gender IS NULL));