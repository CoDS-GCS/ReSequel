WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1875 AND 1975
     AND title IN ('(#1.17)',
                   '(#1.50)',
                   '(#1.60)',
                   '(#1.8)',
                   '(#4.1)',
                   '(#5.9)',
                   '(#6.12)',
                   '(#6.2)',
                   '(#7.6)',
                   'Birds of a Feather',
                   'Breakout',
                   'Broadway Bill',
                   'Buffalo Bill',
                   'Crime of Passion',
                   'Der Raub der Sabinerinnen',
                   'Egri csillagok',
                   'Escape',
                   'Game 3',
                   'His Brothers Keeper',
                   'Hob',
                   'Keep Smiling',
                   'Macbeth',
                   'Mr. District Attorney',
                   'Nothing Sacred',
                   'Open House',
                   'Play School',
                   'Pot-Bouille',
                   'Smoke Screen',
                   'Stree',
                   'Sullivans Travels',
                   'The Avengers',
                   'The Desert Song',
                   'The Glass Key',
                   'The Legend',
                   'The Lost Weekend',
                   'The Milky Way',
                   'The Other Man',
                   'The Photographer',
                   'The Raid',
                   'The Rainmaker',
                   'The Shepherd of the Hills',
                   'The Westerner',
                   'Tillies Punctured Romance',
                   'Tosca')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
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
                   'cinematographer',
                   'composer',
                   'production designer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('4')
  AND mi2.info_type_id IN ('1')
  AND mi1.info IN ('English',
                    'Georgian',
                    'Hindi',
                    'Persian',
                    'Polish',
                    'Portuguese',
                    'Spanish')
  AND mi2.info IN ('16',
                    '17',
                    '22',
                    '58',
                    '63',
                    '68',
                    '7',
                    '78',
                    '85',
                    '90',
                    '97',
                    '98',
                    'USA:30');