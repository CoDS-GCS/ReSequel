
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 2010
     AND kt.kind IN ('episode',
                   'movie')) AS t_filtered
JOIN
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('8')
     AND mi.info IN ('Canada',
                    'East Germany',
                    'France',
                    'Italy',
                    'Japan',
                    'UK',
                    'USA')) AS mi1_filtered ON t_filtered.id = mi1_filtered.movie_id
JOIN
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('7')
     AND mi.info IN ('OFM:16 mm',
                    'OFM:35 mm',
                    'PCS:Spherical',
                    'PFM:16 mm',
                    'PFM:35 mm',
                    'RAT:1.66 : 1',
                    'RAT:1.85 : 1',
                    'RAT:2.35 : 1')) AS mi2_filtered ON t_filtered.id = mi2_filtered.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info ci
   JOIN role_type rt ON ci.role_id = rt.id
   JOIN name n ON ci.person_id = n.id
   WHERE rt.role IN ('actress')
     AND n.gender IN ('m')) AS ci_filtered ON t_filtered.id = ci_filtered.movie_id
JOIN
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('bare-breasts',
                     'blood',
                     'family-relationships',
                     'father-son-relationship',
                     'friendship',
                     'hospital',
                     'independent-film',
                     'interview',
                     'jealousy',
                     'kidnapping',
                     'lesbian-sex',
                     'male-frontal-nudity',
                     'male-nudity',
                     'mother-daughter-relationship',
                     'new-york-city',
                     'number-in-title',
                     'one-word-title',
                     'party',
                     'revenge',
                     'sex',
                     'song',
                     'suicide',
                     'violence')) AS mk_filtered ON t_filtered.id = mk_filtered.movie_id;