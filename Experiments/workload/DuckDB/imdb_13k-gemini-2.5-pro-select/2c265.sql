
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1925 AND 1975
  AND t.title IN ('(#1.19)',
                   '(#1.30)',
                   '(#1.55)',
                   '(#4.24)',
                   '(#6.22)',
                   'Any Number Can Play',
                   'Arsenic and Old Lace',
                   'Bedtime Story',
                   'Border Incident',
                   'Caesars Wife',
                   'Dr. Jekyll and Mr. Hyde',
                   'Half a Sixpence',
                   'Her Highness and the Bellboy',
                   'Invasion',
                   'König Drosselbart',
                   'Made for Each Other',
                   'Mrs. Miniver',
                   'Obsession',
                   'On Trial',
                   'Sanctuary',
                   'Some Like It Hot',
                   'TV-Avisen',
                   'The Adventures of Huckleberry Finn',
                   'The Canterville Ghost',
                   'The Great Ziegfeld',
                   'The Magic Box',
                   'The Morning After',
                   'The Professionals',
                   'The Rainmaker',
                   'The Road Back',
                   'Windfall')
  AND kt.kind IN ('movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND rt.role IN ('cinematographer',
                   'composer',
                   'production designer')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND it1.id IN ('5')
  AND it2.id IN ('8')
  AND mi1.info IN ('Australia:PG',
                    'Finland:K-16',
                    'Germany:12',
                    'Iceland:L',
                    'Italy:VM18',
                    'Norway:16',
                    'UK:12',
                    'UK:A',
                    'USA:PG',
                    'USA:R',
                    'USA:TV-PG')
  AND mi2.info IN ('Argentina',
                    'Austria',
                    'Belgium',
                    'Canada',
                    'Finland',
                    'France',
                    'Hong Kong',
                    'India',
                    'Japan',
                    'Soviet Union',
                    'Sweden');