
SELECT COUNT(*)
FROM movie_info AS mi1
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON mi1.movie_id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN title AS t ON mi1.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE mi1.info IN ('LAB:Technicolor, UK',
                    'MET:120 m',
                    'MET:600 m',
                    'PFM:16 mm',
                    'RAT:1.37 : 1',
                    'RAT:1.66 : 1')
  AND it1.id IN ('7')
  AND mi2.info IN ('A print of this film survives in the UCLA Film and Television Archives.',
                    'In September 1928, Warner Bros. Pictures purchased a majority interest in First National Pictures and from that point on, all "First National" productions were actually made under Warner Bros. control, even though the two companies continued to retain separate identities until the mid-1930s, after which time "A Warner Bros.-First National Picture" was often used.',
                    'Last show of the series.',
                    'One of over 700 Paramount Productions, filmed between 1929 and 1949, which were sold to MCA/Universal in 1958 for television distribution, and have been owned and controlled by Universal ever since.',
                    'One of over 700 Paramount productions, filmed between 1929 and 1949, which were sold to MCA/Universal in 1958 for television distribution, and have been owned and controlled by Universal ever since.',
                    'Original Danish title is undetermined.',
                    'Original French title is undetermined',
                    'Original French title is undetermined.',
                    'This film is believed lost. Please check your attic.',
                    'This film is presumed lost. Please check your attic.')
  AND it2.id IN ('17')
  AND t.production_year BETWEEN 1875 AND 1975
  AND t.title IN ('(#1.17)',
                   '(#4.33)',
                   '(#4.7)',
                   'Black Gold',
                   'Day of Reckoning',
                   'Der Verschwender',
                   'Dny zrady',
                   'Du Barry Was a Lady',
                   'For Love or Money',
                   'Jugovizija',
                   'La verbena de la Paloma',
                   'Night Club',
                   'Night of Terror',
                   'Open House',
                   'Sechster Teil',
                   'Serenade',
                   'Shine on Harvest Moon',
                   'So Big',
                   'Stingaree',
                   'The Christmas Show',
                   'The Devils Playground',
                   'The Edge of Night',
                   'The Guest',
                   'The Honeymoon',
                   'The Journey',
                   'The Mark of Zorro',
                   'The Philadelphia Story',
                   'The Seventh Cross',
                   'What Are Friends For?',
                   'Ziemia obiecana')
  AND kt.kind IN ('movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND n.gender IN ('f',
                    'm')
  AND rt.role IN ('composer',
                   'guest',
                   'miscellaneous crew');