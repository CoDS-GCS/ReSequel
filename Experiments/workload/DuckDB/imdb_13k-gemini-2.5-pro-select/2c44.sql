WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1875 AND 1975
     AND title IN ('(#1.5)',
                   '(#1.84)',
                   '(#4.26)',
                   '(#6.11)',
                   '(#8.6)',
                   'All at Sea',
                   'Dead or Alive',
                   'Der müde Theodor',
                   'Here Come the Girls',
                   'Holnap lesz fácán',
                   'Jack the Ripper',
                   'Kdyby tisíc klarinetu',
                   'Off Limits',
                   'Remontons les Champs-Élysées',
                   'Rio Grande',
                   'Safari',
                   'Samson',
                   'See No Evil',
                   'She Couldnt Say No',
                   'Si Paris nous était conté',
                   'Side Street',
                   'The Battle',
                   'The Experiment',
                   'The Ransom',
                   'The Shakedown',
                   'The Spider',
                   'The System',
                   'The Visitors',
                   'The Witching Hour',
                   'You Came Along')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'costume designer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('1')
  AND mi2.info_type_id IN ('2')
  AND mi1.info IN ('12',
                    '16',
                    '23',
                    '25',
                    '68',
                    '75',
                    '76',
                    '89',
                    '94')
  AND mi2.info IN ('Black and White',
                    'Color');