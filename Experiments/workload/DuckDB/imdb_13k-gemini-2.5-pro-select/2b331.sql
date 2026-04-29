WITH mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('16th-street-baptist-church',
                     'anti-youth',
                     'belief-in-the-supernatural',
                     'big-belly',
                     'brother-brother-reunion',
                     'bulldyke',
                     'demand',
                     'headband',
                     'helping-a-poor-woman',
                     'hovel',
                     'hwatoo',
                     'indian-landlord',
                     'indonesian-war',
                     'ochlocracy',
                     'pretending-to-lose-ones-virginity',
                     'public-masturbation',
                     'rape-confession',
                     'reference-to-king-henry-iv',
                     'scrubbing-out-ones-mouth',
                     'su-chow-china'))
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
WHERE t.production_year BETWEEN 1990 AND 2015
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND it1.id IN ('7')
  AND mi1.info IN ('CAM:Arriflex Cameras and Lenses',
                    'CAM:Canon 7D',
                    'LAB:DeLuxe',
                    'LAB:DeLuxe, Hollywood (CA), USA',
                    'PCS:HDCAM',
                    'PCS:HDTV',
                    'PCS:Redcode RAW',
                    'PFM:DVD-ROM',
                    'RAT:1.78 : 1 / (anamorphic)',
                    'RAT:16:9 HD')
  AND it2.id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color')
  AND rt.role IN ('actress',
                   'composer')
  AND n.gender IN ('m');