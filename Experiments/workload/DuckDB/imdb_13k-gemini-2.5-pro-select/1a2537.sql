WITH movie_subset AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 1975
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series'))
SELECT COUNT(*)
FROM movie_subset
INNER JOIN movie_info mi1 ON movie_subset.id = mi1.movie_id
INNER JOIN info_type it1 ON mi1.info_type_id = it1.id
INNER JOIN movie_info mi2 ON movie_subset.id = mi2.movie_id
INNER JOIN info_type it2 ON mi2.info_type_id = it2.id
INNER JOIN cast_info ci ON movie_subset.id = ci.movie_id
INNER JOIN name n ON ci.person_id = n.id
INNER JOIN role_type rt ON ci.role_id = rt.id
WHERE it1.id IN ('17')
  AND mi1.info IN ('In September 1928, Warner Bros. Pictures purchased a majority interest in First National Pictures and from that point on, all "First National" productions were actually made under Warner Bros. control, even though the two companies continued to retain separate identities until the mid-1930s, after which time "A Warner Bros.-First National Picture" was often used.',
                    'Last show of the series.',
                    'One of over 700 Paramount Productions, filmed between 1929 and 1949, which were sold to MCA/Universal in 1958 for television distribution, and have been owned and controlled by Universal ever since.',
                    'One of over 700 Paramount productions, filmed between 1929 and 1949, which were sold to MCA/Universal in 1958 for television distribution, and have been owned and controlled by Universal ever since.',
                    'The failure of the original copyright holder to renew the films copyright resulted in it falling into public domain, meaning that virtually anyone could duplicate and sell a VHS/DVD copy of the film. Therefore, many of the versions of this film available on the market are either severely (and usually badly) edited and/or of extremely poor quality, having been duped from second- or third-generation (or more) copies of the film.',
                    'This film is believed lost. Please check your attic.',
                    'This film is presumed lost. Please check your attic.')
  AND it2.id IN ('7')
  AND mi2.info IN ('LAB:DeLuxe',
                    'LAB:DeLuxe, USA',
                    'MET:',
                    'PCS:Todd-AO',
                    'PFM:8 mm',
                    'RAT:1.78 : 1',
                    'RAT:2.20 : 1')
  AND n.gender IS NULL
  AND rt.role IN ('actress',
                   'producer');