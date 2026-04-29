 
 
SELECT COUNT(*)
FROM
  (SELECT t.id
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
     AND t.kind_id = kt.id
     AND ci.person_id = n.id
     AND ci.role_id = rt.id
     AND it1.id IN ('17')
     AND it2.id IN ('7')
     AND mi1.info IN ('In September 1928, Warner Bros. Pictures purchased a majority interest in First National Pictures and from that point on, all "First National" productions were actually made under Warner Bros. control, even though the two companies continued to retain separate identities until the mid-1930s, after which time "A Warner Bros.-First National Picture" was often used.',
                    'Last show of the series.',
                    'One of over 700 Paramount Productions, filmed between 1929 and 1949, which were sold to MCA/Universal in 1958 for television distribution, and have been owned and controlled by Universal ever since.',
                    'One of over 700 Paramount productions, filmed between 1929 and 1949, which were sold to MCA/Universal in 1958 for television distribution, and have been owned and controlled by Universal ever since.',
                    'The failure of the original copyright holder to renew the films copyright resulted in it falling into public domain, meaning that virtually anyone could duplicate and sell a VHS/DVD copy of the film. Therefore, many of the versions of this film available on the market are either severely (and usually badly) edited and/or of extremely poor quality, having been duped from second- or third-generation (or more) copies of the film.',
                    'This film is believed lost. Please check your attic.',
                    'This film is presumed lost. Please check your attic.')
     AND mi2.info IN ('LAB:DeLuxe',
                    'LAB:DeLuxe, USA',
                    'MET:',
                    'PCS:Todd-AO',
                    'PFM:8 mm',
                    'RAT:1.78 : 1',
                    'RAT:2.20 : 1')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series')
     AND rt.role IN ('actress',
                   'producer')
     AND n.gender IS NULL
     AND t.production_year BETWEEN 1925 AND 1975) AS subquery;