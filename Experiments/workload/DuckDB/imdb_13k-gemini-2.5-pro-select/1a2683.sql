
SELECT COUNT(*)
FROM title AS t,
     kind_type AS kt,
     info_type AS it1,
     movie_info AS mi1,
     movie_info AS mi2,
     info_type AS it2,
     cast_info AS ci,
     role_type AS rt,
     name AS n
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND mi1.info_type_id = it1.id
  AND mi2.info_type_id = it2.id
  AND it1.id IN ('16')
  AND it2.id IN ('8')
  AND t.kind_id = kt.id
  AND ci.person_id = n.id
  AND ci.role_id = rt.id
  AND mi1.info IN ('France:1908',
                    'France:1909',
                    'France:1910',
                    'Italy:1913',
                    'USA:January 1903')
  AND mi2.info IN ('Argentina',
                    'Belgium',
                    'Brazil',
                    'Canada',
                    'Czechoslovakia',
                    'Germany',
                    'Italy',
                    'Mexico',
                    'Norway',
                    'Pakistan',
                    'Soviet Union',
                    'Turkey',
                    'UK')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND rt.role IN ('cinematographer',
                   'composer',
                   'production designer',
                   'writer')
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND t.production_year BETWEEN 1875 AND 1975;