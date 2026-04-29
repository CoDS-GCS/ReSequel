
SELECT COUNT(*)
FROM title AS t,
     cast_info AS ci,
     movie_info AS mi1,
     movie_info AS mi2
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.production_year <= 1975
  AND t.production_year >= 1875
  AND t.title IN ('(#2.20)',
                   '(#2.9)',
                   '(#5.7)',
                   '(#8.13)',
                   'Antigone',
                   'Jeder stirbt für sich allein',
                   'Justice',
                   'Little Boy Lost',
                   'Madeleine',
                   'Manhunt',
                   'Scaramouche',
                   'The Assassin',
                   'The Best Man',
                   'The Bounty Hunter',
                   'The Pied Piper',
                   'The Ring',
                   'The Show of Shows',
                   'Thirty Seconds Over Tokyo',
                   'Trial by Fire',
                   'Wing and a Prayer')
  AND mi1.info_type_id IN ('2')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info_type_id IN ('3')
  AND mi2.info IN ('Adventure',
                    'Biography',
                    'Comedy',
                    'Crime',
                    'Family',
                    'Game-Show',
                    'History',
                    'Music',
                    'Thriller',
                    'War')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('movie',
                   'tv movie',
                   'tv series'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f',
                    'm'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'costume designer',
                   'director',
                   'editor',
                   'production designer'));