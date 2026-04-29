 
 
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
  AND (it1.id IN ('8'))
  AND (it2.id IN ('18'))
  AND t.kind_id = kt.id
  AND ci.person_id = n.id
  AND ci.role_id = rt.id
  AND (mi1.info IN ('Australia',
                    'Canada',
                    'Mexico',
                    'UK',
                    'USA'))
  AND (mi2.info IN ('Chicago, Illinois, USA',
                    'Desilu Studios - 9336 W. Washington Blvd., Culver City, California, USA',
                    'London, England, UK',
                    'Mexico City, Distrito Federal, Mexico',
                    'Miami, Florida, USA',
                    'New Orleans, Louisiana, USA',
                    'Philadelphia, Pennsylvania, USA',
                    'Seattle, Washington, USA',
                    'Sydney, New South Wales, Australia',
                    'Vancouver, British Columbia, Canada'))
  AND (kt.kind IN ('tv movie',
                   'tv series',
                   'video game'))
  AND (rt.role IN ('actress',
                   'writer'))
  AND (n.gender IN ('f',
                    'm'))
  AND (t.production_year <= 2015)
  AND (t.production_year >= 1925);