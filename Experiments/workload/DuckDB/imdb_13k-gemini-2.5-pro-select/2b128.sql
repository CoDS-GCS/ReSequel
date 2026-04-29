WITH t_filtered AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('tv movie',
                   'tv series'))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE mi1.info_type_id IN ('4')
  AND mi1.info IN ('English')
  AND mi2.info_type_id IN ('105')
  AND mi2.info IN ('$12,000',
                    '$150,000',
                    '$2,000,000',
                    '$200',
                    '$300,000',
                    '$35,000',
                    '$5,000,000',
                    '$6,000',
                    '$8,000',
                    '£1,000')
  AND n.gender IN ('m')
  AND rt.role IN ('costume designer',
                   'editor')
  AND k.keyword IN ('advocate-magazine',
                     'burning-a-passport',
                     'cross-country-race',
                     'death-of-main-character',
                     'ed-sullivan',
                     'falsetto-voice',
                     'fire-in-a-wastepaper-basket',
                     'fountain-of-love',
                     'grand-opera',
                     'jazz-trio',
                     'king-louis-xi',
                     'mall-security',
                     'monopoly-money',
                     'monster',
                     'mulatto',
                     'murderous-wager',
                     'music-score-features-harpsichord',
                     'near-miss',
                     'payroll',
                     'reference-to-charles-bronson',
                     'reference-to-tess-of-the-dubervilles',
                     'reference-to-tiffanys',
                     'rolling-spin',
                     'skit-and-skat',
                     'streetcar-conductor');