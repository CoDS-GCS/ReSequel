WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND t.title IN ('(#1.157)',
                   '(#1.159)',
                   '(#1.461)',
                   '(#1.569)',
                   '(#1.712)',
                   '(#2.22)',
                   '(1988-12-17)',
                   'A Girls Best Friend',
                   'Annie',
                   'Brainstorm',
                   'Children of the Night',
                   'Discipline',
                   'Hollywood Goes to War',
                   'House of Cards',
                   'Jappening con Ja',
                   'Lulu',
                   'Men of Respect',
                   'Out of Bounds',
                   'Something to Live For',
                   'Teil 2',
                   'Temptation',
                   'The Fall Guy',
                   'The Gypsies',
                   'The Lie',
                   'The Little Match Girl',
                   'The Love Machine',
                   'The Patriot',
                   'The Teacher',
                   'The Way We Were',
                   'To Kill a Cop',
                   'True Grit',
                   'Up the Creek',
                   'When in Rome')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
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
  AND rt.role IN ('costume designer',
                   'editor',
                   'guest',
                   'miscellaneous crew',
                   'writer')
  AND it1.id IN ('18')
  AND mi1.info IN ('California, USA',
                    'London, England, UK',
                    'Miami, Florida, USA',
                    'Santa Clarita, California, USA',
                    'Spain',
                    'Sydney, New South Wales, Australia',
                    'Toronto, Ontario, Canada',
                    'USA')
  AND it2.id IN ('3')
  AND mi2.info IN ('Action',
                    'Adventure',
                    'Comedy',
                    'Crime',
                    'Fantasy',
                    'History',
                    'Horror',
                    'Music',
                    'Sci-Fi',
                    'Short',
                    'Western');