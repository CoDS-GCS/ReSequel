
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN title AS t ON ci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE n.gender IS NULL
  AND rt.role IN ('editor')
  AND t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('tv movie',
                   'tv series')
  AND it1.id IN ('7')
  AND mi1.info IN ('LAB:Boyana Film Laboratory, Sofia, Bulgaria',
                    'LAB:Kinuta Laboratories, Tokyo, Japan',
                    'LAB:Technicolor, Hollywood (CA), USA',
                    'OFM:35 mm',
                    'PCS:CinemaScope',
                    'PCS:Redcode RAW',
                    'PFM:16 mm',
                    'PFM:35 mm',
                    'RAT:1.33 : 1',
                    'RAT:1.37 : 1',
                    'RAT:16:9 HD',
                    'RAT:2.35 : 1')
  AND it2.id IN ('4')
  AND mi2.info IN ('Bulgarian',
                    'Cantonese',
                    'English',
                    'German',
                    'Hindi',
                    'Italian',
                    'Japanese',
                    'Korean',
                    'Spanish',
                    'Swedish')
  AND k.keyword IN ('bergdorfs-department-store-manhattan-new-york-city',
                     'cabin',
                     'closing-monologue',
                     'gram',
                     'horseshoe',
                     'klussen',
                     'mountain-crossing',
                     'mullet',
                     'mylar-helium-balloon',
                     'nathan-hill',
                     'national-inquirer-magazine',
                     'native',
                     'painting-a-bicycle',
                     'pharmacy',
                     'post-world-war-two-germany',
                     'recovering-from-illness',
                     'reference-to-bee',
                     'reference-to-mobile-alabama',
                     'special-school',
                     'thumbelina',
                     'western-music',
                     'woman-general',
                     'z-boson');