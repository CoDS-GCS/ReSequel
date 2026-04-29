WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 1975
     AND title IN ('(#1.109)',
                   '(#1.44)',
                   '(#1.89)',
                   '(#2.4)',
                   '(#2.43)',
                   '(#5.4)',
                   '(#7.5)',
                   'Bobby',
                   'Brief Encounter',
                   'Erster Teil',
                   'King Lear',
                   'Legacy',
                   'Life with Father',
                   'Mr. District Attorney',
                   'Obsession',
                   'Seishun to wa nanda',
                   'She Gets Her Man',
                   'Sister Kenny',
                   'Sweet Charity',
                   'The Big Show',
                   'The Hospital',
                   'The Matchmaker',
                   'The Perils of Pauline',
                   'The Turning Point',
                   'Way Out West',
                   'With a Song in My Heart')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('tv series',
                   'video game',
                   'video movie'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actress',
                   'editor',
                   'guest'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('2')
  AND mi2.info_type_id IN ('4')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info IN ('Arabic',
                    'English',
                    'Hindi',
                    'Hungarian',
                    'Korean',
                    'Mandarin',
                    'Tagalog',
                    'Telugu');