
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie'))
  AND mi1.info_type_id IN ('2')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info_type_id IN ('5')
  AND mi2.info IN ('Finland:(Banned)',
                    'Iceland:L',
                    'Norway:16',
                    'Sweden:Btl',
                    'UK:PG',
                    'UK:X',
                    'USA:Unrated',
                    'West Germany:18')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('writer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('972-year-old',
                     'aerial-gunner',
                     'aztec-temple',
                     'boatswain',
                     'committing-suicide',
                     'communist-persecution',
                     'double-indemnity',
                     'gun-training',
                     'hydrogeology',
                     'loan-and-trust-company',
                     'murder-of-aunt-by-aunt',
                     'platform-shoes',
                     'radetzky-march',
                     'recurring-gag',
                     'reference-to-miserere-mei-deus-the-musical-composition',
                     'runaway-truck',
                     'russian-royalty',
                     'sales-pitch',
                     'skin-shot-off',
                     'stagecoach-rollover',
                     'taxidermy',
                     'three-word-title',
                     'weisbaden-germany'));