WITH mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('bad-memory',
                     'bed-ridden-child',
                     'boulder-colorado',
                     'box-of-peas',
                     'business-plan',
                     'chinese-in-hawaii',
                     'electromagnetic-pulse',
                     'flamingo',
                     'giant-balloon',
                     'goat-facing-a-tree-sex-position',
                     'high-school-soccer',
                     'kicking-a-dog',
                     'pamper',
                     'photographing-sex',
                     'playoffs',
                     'raw-milk',
                     'reference-to-molly-brown',
                     'reference-to-robert-hossein',
                     'refreshment-stand',
                     'return-of-classic-doctor-who-character',
                     'smelling',
                     'tearing-up-a-photograph',
                     'toll',
                     'undercover'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN mk_filtered AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND it1.id IN ('105')
  AND mi1.info IN ('$10,000',
                    '$100,000',
                    '$15,000',
                    '$2,000',
                    '$2,500',
                    '$20,000',
                    '$30,000',
                    '$50,000',
                    '$6,000',
                    '£1,000',
                    '€ 1,000',
                    '€ 5,000')
  AND it2.id IN ('3')
  AND mi2.info IN ('Comedy',
                    'Documentary',
                    'Drama',
                    'Horror',
                    'Short')
  AND rt.role IN ('costume designer',
                   'director')
  AND n.gender IN ('f',
                    'm');