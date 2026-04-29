
SELECT COUNT(*)
FROM title AS t,
     kind_type AS kt,
     info_type AS it1,
     movie_info AS mi1,
     movie_info AS mi2,
     info_type AS it2,
     cast_info AS ci,
     role_type AS rt,
     name AS n,
     movie_keyword AS mk,
     keyword AS k
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.id = mk.movie_id
  AND k.id = mk.keyword_id
  AND mi1.movie_id = mi2.movie_id
  AND mi1.info_type_id = it1.id
  AND mi2.info_type_id = it2.id
  AND t.kind_id = kt.id
  AND ci.person_id = n.id
  AND ci.role_id = rt.id
  AND it1.id IN ('5')
  AND it2.id IN ('8')
  AND mi1.info IN ('Argentina:13',
                    'Brazil:14',
                    'Finland:K-11',
                    'Germany:o.Al.',
                    'India:A',
                    'Malaysia:U',
                    'Peru:14',
                    'Portugal:M/12',
                    'South Korea:All',
                    'UK:15',
                    'UK:E',
                    'USA:R')
  AND mi2.info IN ('Argentina',
                    'France',
                    'Germany',
                    'India',
                    'UK',
                    'USA')
  AND kt.kind IN ('tv movie',
                   'tv series')
  AND rt.role IN ('producer')
  AND n.gender IS NULL
  AND t.production_year BETWEEN 1990 AND 2015;