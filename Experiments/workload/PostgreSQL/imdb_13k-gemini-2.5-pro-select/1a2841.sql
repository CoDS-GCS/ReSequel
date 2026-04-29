
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
  AND it1.id IN ('18')
  AND it2.id IN ('8')
  AND t.kind_id = kt.id
  AND ci.person_id = n.id
  AND ci.role_id = rt.id
  AND mi1.info IN ('Bavaria Filmstudios, Geiselgasteig, Grünwald, Bavaria, Germany',
                    'CBS Studio 50, New York City, New York, USA',
                    'Mexico',
                    'Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA')
  AND mi2.info IN ('Argentina',
                    'Austria',
                    'Brazil',
                    'Czechoslovakia',
                    'Denmark',
                    'India',
                    'Italy',
                    'Mexico',
                    'Philippines',
                    'Portugal',
                    'Sweden',
                    'Switzerland',
                    'UK',
                    'USA',
                    'Yugoslavia')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video movie')
  AND rt.role IN ('cinematographer')
  AND (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND t.production_year BETWEEN 1950 AND 1990;