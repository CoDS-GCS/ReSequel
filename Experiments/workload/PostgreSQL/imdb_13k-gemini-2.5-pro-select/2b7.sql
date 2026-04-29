WITH mi1_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('3')
     AND mi.info IN ('Action',
                    'Adventure',
                    'Animation',
                    'Comedy',
                    'Crime',
                    'Documentary',
                    'Drama',
                    'Family',
                    'Horror',
                    'Thriller')),
     mi2_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('5')
     AND mi.info IN ('Australia:G',
                    'Australia:R',
                    'Canada:G',
                    'Chile:14',
                    'France:U',
                    'Germany:18',
                    'Netherlands:16',
                    'Singapore:M18',
                    'South Korea:12',
                    'South Korea:18',
                    'Switzerland:14',
                    'UK:U',
                    'USA:G',
                    'USA:Not Rated'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN mi1_filtered mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND rt.role IN ('producer',
                   'writer')
  AND n.gender IN ('m')
  AND k.keyword IN ('argument-between-couple',
                     'black-box',
                     'blood-drip',
                     'bowl-of-cherries',
                     'coca-cola-cooler',
                     'country-estate',
                     'daniel-boone',
                     'father-daughter-dating-same-woman',
                     'gang-brawl',
                     'international-criminal-court',
                     'kennedy',
                     'longshoremans-hook',
                     'lost-boy',
                     'medical-consent-form',
                     'picture-on-a-billboard',
                     'playboy-magazine',
                     'reference-to-robert-bork',
                     'reference-to-the-god-jupiter',
                     'rio-grande-river',
                     'school-sale',
                     'toilet-flush-off-camera',
                     'turned-into-bird',
                     'war-relics',
                     'washing-a-dress');