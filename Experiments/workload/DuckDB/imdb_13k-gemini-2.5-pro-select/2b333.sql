
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year >= 1975
     AND t.production_year <= 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'video movie')) AS t_filtered
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('2')
     AND info IN ('Color')) AS mi1_filtered ON t_filtered.id = mi1_filtered.movie_id
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('1')
     AND info IN ('33',
                    '63',
                    'USA:19',
                    'USA:23',
                    'USA:50',
                    'USA:70',
                    'USA:87',
                    'USA:95')) AS mi2_filtered ON t_filtered.id = mi2_filtered.movie_id
JOIN
  (SELECT mk.movie_id
   FROM movie_keyword AS mk
   JOIN keyword AS k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('based-on-play',
                     'dancing',
                     'family-relationships',
                     'father-daughter-relationship',
                     'female-frontal-nudity',
                     'flashback',
                     'friendship',
                     'homosexual',
                     'independent-film',
                     'lesbian',
                     'male-frontal-nudity',
                     'marriage',
                     'mother-daughter-relationship',
                     'number-in-title',
                     'police',
                     'revenge',
                     'suicide',
                     'tv-mini-series')) AS mk_filtered ON t_filtered.id = mk_filtered.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IS NULL
     AND rt.role IN ('director',
                   'producer')) AS ci_filtered ON t_filtered.id = ci_filtered.movie_id;