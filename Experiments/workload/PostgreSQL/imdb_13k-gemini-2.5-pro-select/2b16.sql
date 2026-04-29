WITH t_filtered AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game'))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE mi1.info_type_id IN ('8')
  AND mi1.info IN ('Belgium',
                    'Czech Republic',
                    'Finland',
                    'Greece',
                    'Ireland',
                    'Italy',
                    'Japan',
                    'Turkey')
  AND mi2.info_type_id IN ('2')
  AND mi2.info IN ('Color')
  AND n.gender IN ('f',
                    'm')
  AND rt.role IN ('cinematographer',
                   'composer')
  AND k.keyword IN ('12-bar-blues',
                     'applied-arts',
                     'attempted-coup-détat',
                     'diego-velazquez',
                     'diesel-engineer',
                     'diesel-oil',
                     'easthampton-new-york',
                     'emu',
                     'eucharist',
                     'evil-politician',
                     'friendly-rival',
                     'guitar-riff',
                     'investment-broker',
                     'minister-of-war',
                     'open-relationship',
                     'peruvian-flag',
                     'platform',
                     'reference-to-joe-cocker',
                     'rice-liquor',
                     'self-hatred',
                     'social',
                     'teaching-to-dance',
                     'thunder-and-lightning',
                     'university-of-wisconsin',
                     'wedding-photograohy');