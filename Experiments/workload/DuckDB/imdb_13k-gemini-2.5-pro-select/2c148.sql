WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 1975
     AND title IN ('(#1.13)',
                   '(#1.28)',
                   '(#1.92)',
                   '(#3.19)',
                   '(#6.24)',
                   '(#6.6)',
                   '(#7.6)',
                   'A Matter of Life and Death',
                   'All That Glitters',
                   'Aoi sanmyaku',
                   'Appassionata',
                   'Babes in Toyland',
                   'Chance of a Lifetime',
                   'Dobrý voják Svejk',
                   'Finders Keepers',
                   'Follow the Boys',
                   'Ghost Town',
                   'Heritage',
                   'Hobsons Choice',
                   'Kabale und Liebe',
                   'Le capitaine Fracasse',
                   'Leuchtfeuer',
                   'Mildred Pierce',
                   'Only Yesterday',
                   'The Connection',
                   'The Gamblers',
                   'The Harder They Fall',
                   'The Invisible Enemy',
                   'The Longest Day',
                   'The Mark of Cain',
                   'The Plainsman',
                   'The Promise',
                   'The Shakedown',
                   'The Spiders Web',
                   'The Suspect',
                   'The Swordsman',
                   'The Target',
                   'Tommy',
                   'You Cant Take It with You')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('costume designer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('8')
  AND mi2.info_type_id IN ('2')
  AND mi1.info IN ('Belgium',
                    'India',
                    'Iran',
                    'Mexico',
                    'Netherlands',
                    'Poland',
                    'Turkey',
                    'USA')
  AND mi2.info IN ('Black and White',
                    'Color');