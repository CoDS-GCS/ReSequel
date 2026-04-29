WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND t.title IN ('(#1.3459)',
                   '(1998-10-28)',
                   '(2008-12-19)',
                   '(2009-01-10)',
                   'Behati Has Evil Plans for Esmeralda',
                   'Carmen Electra',
                   'Climb Every Mountain',
                   'Domino Effect',
                   'Fire and Ice',
                   'Going Overboard',
                   'High Stakes',
                   'Last Tango',
                   'Let It Be Me',
                   'Secret History of Religion: Doomsday - Book of Revelation',
                   'The Incident',
                   'The Quarry',
                   'The Rita Flower or the Indelible Stench',
                   'The Sullivans',
                   'Touch of Death',
                   'Transamerica',
                   'Turkish Delight',
                   'Volcano Vacation Hell',
                   'You Do It to Yourself')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'video game'))
SELECT COUNT(*)
FROM filtered_movies AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE n.gender IN ('f',
                    'm')
  AND rt.role IN ('actor',
                   'actress')
  AND it1.id IN ('2')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND it2.id IN ('4')
  AND mi2.info IN ('Bulgarian',
                    'Czech',
                    'English',
                    'Hindi',
                    'Japanese',
                    'Malayalam',
                    'Norwegian',
                    'Oriya',
                    'Urdu',
                    'Yoruba');