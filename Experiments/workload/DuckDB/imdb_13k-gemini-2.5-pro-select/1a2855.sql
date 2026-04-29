
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('producer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('7')
  AND mi1.info IN ('LAB:DeLuxe, USA',
                    'LAB:Technicolor, UK',
                    'OFM:35 mm',
                    'PCS:CinemaScope',
                    'PCS:Techniscope',
                    'RAT:1.85 : 1',
                    'RAT:2.55 : 1',
                    'RAT:4:3')
  AND mi2.info_type_id IN ('17')
  AND mi2.info IN ('A print of this film survives in the UCLA Film and Television Archives.',
                    'In September 1928, Warner Bros. Pictures purchased a majority interest in First National Pictures and from that point on, all "First National" productions were actually made under Warner Bros. control, even though the two companies continued to retain separate identities until the mid-1930s, after which time "A Warner Bros.-First National Picture" was often used.',
                    'Last show of the series.',
                    'One of over 700 Paramount productions, filmed between 1929 and 1949, which were sold to MCA/Universal in 1958 for television distribution, and have been owned and controlled by Universal ever since.',
                    'Original Danish title is undetermined.',
                    'Original French title is undetermined.',
                    'This film is believed lost. Please check your attic.',
                    'This film is presumed lost. Please check your attic.');