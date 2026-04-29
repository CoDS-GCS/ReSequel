 
 
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
  AND (it1.id IN ('18'))
  AND (it2.id IN ('7'))
  AND t.kind_id = kt.id
  AND ci.person_id = n.id
  AND ci.role_id = rt.id
  AND (mi1.info IN ('20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Berlin, Germany',
                    'General Service Studios - 1040 N. Las Palmas, Hollywood, Los Angeles, California, USA',
                    'Iverson Ranch - 1 Iverson Lane, Chatsworth, Los Angeles, California, USA',
                    'Los Angeles, California, USA',
                    'Metromedia Square - 5746 W. Sunset Blvd., Hollywood, Los Angeles, California, USA',
                    'New York City, New York, USA',
                    'Republic Studios - 4024 Radford Avenue, North Hollywood, Los Angeles, California, USA',
                    'Revue Studios, Hollywood, Los Angeles, California, USA',
                    'Toronto, Ontario, Canada',
                    'Universal Studios - 100 Universal City Plaza, Universal City, California, USA',
                    'Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA'))
  AND (mi2.info IN ('OFM:35 mm',
                    'OFM:Live',
                    'OFM:Video',
                    'PCS:Spherical',
                    'PFM:35 mm',
                    'RAT:1.33 : 1'))
  AND (kt.kind IN ('tv movie',
                   'tv series',
                   'video game'))
  AND (rt.role IN ('miscellaneous crew'))
  AND (n.gender IN ('f'))
  AND (t.production_year <= 2015)
  AND (t.production_year >= 1925);