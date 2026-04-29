WITH mi1_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('105')
     AND mi.info IN ('$1,500',
                    '$150,000',
                    '$200,000',
                    '$3,000')),
     mi2_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('2')
     AND mi.info IN ('Color'))
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
WHERE t.production_year BETWEEN 1990 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND rt.role IN ('cinematographer',
                   'editor')
  AND n.gender IN ('f',
                    'm')
  AND k.keyword IN ('another-way-home',
                     'bribe-attempt',
                     'ca-68-uss-baltimore',
                     'corporate-manager',
                     'corporation',
                     'council-estate',
                     'dragon-ball-z',
                     'fulford',
                     'galathea-expedition',
                     'heavy-rain',
                     'hemorrhoid',
                     'northridge-earthquake',
                     'nsdap',
                     'pet-euthanasia',
                     'runaway-covered-wagon',
                     'submarine-telephone-cable',
                     'talking-to-a-cat',
                     'understudy',
                     'unusual-sex-acts',
                     'visually-impaired-person');