WITH mi1_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('7')
     AND mi.info IN ('PFM:35 mm',
                    'RAT:1.33 : 1',
                    'RAT:1.85 : 1')),
     mi2_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('1')
     AND mi.info IN ('100',
                    '22',
                    '60',
                    '90',
                    'USA:60'))
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
WHERE t.production_year BETWEEN 1990 AND 2015
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND rt.role IN ('miscellaneous crew')
  AND n.gender IN ('f')
  AND k.keyword IN ('cross-cultural-mentoring',
                     'fight-in-water',
                     'german-sailor',
                     'lesbian-makeup-artist',
                     'mixed-media',
                     'nightcap',
                     'note-read-aloud',
                     'obscenic-gesture',
                     'pulaski-tennessee',
                     'putin',
                     'rectal-pain',
                     'reference-to-the-swastika',
                     'reference-to-world-trade-organization',
                     'ripple-effect',
                     'runaway-girls',
                     'shojo',
                     'swinging-from-chandelier',
                     'terran',
                     'top-gun',
                     'unbeatable',
                     'wanted-person',
                     'woman-rancher',
                     'workplace');