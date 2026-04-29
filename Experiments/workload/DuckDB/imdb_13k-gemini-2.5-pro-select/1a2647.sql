
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
WHERE t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND it1.id IN ('17')
  AND mi1.info IN ('ABC originally broadcast this episode in black and white.',
                    'Despite the fact that this was filmed in Super 35, "Filmed in Panavision" is listed in the end credits.',
                    'In September 1928, Warner Bros. Pictures purchased a majority interest in First National Pictures and from that point on, all "First National" productions were actually made under Warner Bros. control, even though the two companies continued to retain separate identities until the mid-1930s, after which time "A Warner Bros.-First National Picture" was often used.',
                    'One of over 700 Paramount Productions, filmed between 1929 and 1949, which were sold to MCA/Universal in 1958 for television distribution, and have been owned and controlled by Universal ever since.',
                    'This film is presumed lost. Please check your attic.')
  AND it2.id IN ('7')
  AND mi2.info IN ('CAM:Arriflex 435 ES, Panavision Primo Lenses',
                    'OFM:65 mm',
                    'OFM:Digital',
                    'OFM:HDCAM',
                    'PFM:35 mm')
  AND rt.role IN ('actress')
  AND (n.gender IN ('f')
       OR n.gender IS NULL);