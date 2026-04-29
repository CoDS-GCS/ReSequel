
SELECT COUNT(*)
FROM title AS t
INNER JOIN kind_type AS kt ON t.kind_id = kt.id
INNER JOIN movie_info AS mi1 ON t.id = mi1.movie_id
INNER JOIN info_type AS it1 ON mi1.info_type_id = it1.id
INNER JOIN movie_info AS mi2 ON t.id = mi2.movie_id
INNER JOIN info_type AS it2 ON mi2.info_type_id = it2.id
INNER JOIN cast_info AS ci ON t.id = ci.movie_id
INNER JOIN name AS n ON ci.person_id = n.id
INNER JOIN role_type AS rt ON ci.role_id = rt.id
WHERE t.production_year BETWEEN 1925 AND 1975
  AND t.title IN ('(#1.125)',
                   '(#1.19)',
                   '(#1.82)',
                   'A Question of Guilt',
                   'A Time to Die',
                   'All the Kings Men',
                   'Battleground',
                   'Bellbird',
                   'Billy the Kid',
                   'Blood Money',
                   'Carrie',
                   'Cimarron',
                   'Dragnet',
                   'Fall Guy',
                   'Familie Benthin',
                   'Government Girl',
                   'Happy Landing',
                   'Jam Session',
                   'Les trois mousquetaires',
                   'Night and Day',
                   'Ordeal',
                   'Requiem for a Heavyweight',
                   'Sergeant York',
                   'Shoot to Kill',
                   'State of the Union',
                   'Sweet Rosie OGrady',
                   'The Exchange',
                   'The Gamble',
                   'The Great Sinner',
                   'The Longest Day',
                   'The Man Outside',
                   'The Politician',
                   'The Whole Towns Talking',
                   'The Witch',
                   'The Wrong Box',
                   'Tonka',
                   'Unterwegs zu Lenin',
                   'Yolanda and the Thief')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'video game',
                   'video movie')
  AND it1.id IN ('16')
  AND mi1.info IN ('Austria:1930',
                    'Austria:1951',
                    'Germany:1928',
                    'UK:1957',
                    'UK:1959',
                    'USA:1952',
                    'USA:1953',
                    'USA:1954',
                    'USA:1956',
                    'USA:1958',
                    'USA:1959',
                    'USA:1960',
                    'USA:1961',
                    'USA:1962',
                    'USA:1963')
  AND it2.id IN ('7')
  AND mi2.info IN ('CAM:Arriflex Cameras',
                    'LAB:Laboratoires LTC, St. Cloud, France',
                    'LAB:Movielab, USA',
                    'MET:300 m',
                    'OFM:35 mm',
                    'OFM:Live',
                    'OFM:Video',
                    'PCS:Panavision',
                    'PFM:8 mm',
                    'RAT:2.20 : 1',
                    'RAT:2.55 : 1')
  AND rt.role IN ('editor',
                   'guest',
                   'writer')
  AND (n.gender IN ('m')
       OR n.gender IS NULL);