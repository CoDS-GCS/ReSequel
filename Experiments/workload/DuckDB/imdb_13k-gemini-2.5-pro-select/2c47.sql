
SELECT COUNT(*)
FROM title AS t,
     cast_info AS ci,
     movie_info AS mi1,
     movie_info AS mi2
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.production_year <= 1975
  AND t.production_year >= 1925
  AND t.title IN ('(#1.107)',
                   '(#1.21)',
                   '(#1.27)',
                   '(#1.38)',
                   '(#1.60)',
                   '(#4.2)',
                   '(#8.5)',
                   'A Matter of Honor',
                   'Accused',
                   'Airport 1975',
                   'Another Thin Man',
                   'Cinderella',
                   'Crack-Up',
                   'Diamond Jim',
                   'Die Ratten',
                   'Dritter Teil',
                   'Fall Guy',
                   'False Witness',
                   'Fear',
                   'Going Home',
                   'Happy Birthday',
                   'Harlow',
                   'High Stakes',
                   'Killer McCoy',
                   'Le fantôme de la liberté',
                   'Many Happy Returns',
                   'Maya Bazaar',
                   'Meet the People',
                   'Navy Wife',
                   'Richard II Part 2: The Deposing of a King',
                   'Ride the Man Down',
                   'Serenade',
                   'Shadow of a Man',
                   'Shoot to Kill',
                   'Show Boat',
                   'Si Versailles métait conté',
                   'Star Spangled Rhythm',
                   'The Cardinal',
                   'The Executioner',
                   'The Frog',
                   'The Harvey Girls',
                   'The One That Got Away',
                   'The Plunderers',
                   'The Predators',
                   'The Shepherd of the Hills',
                   'The Winslow Boy',
                   'The Wrestler',
                   'White Eagle')
  AND mi1.info_type_id IN ('2')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info_type_id IN ('5')
  AND mi2.info IN ('Argentina:13',
                    'Australia:G',
                    'Finland:K-18',
                    'Norway:16',
                    'UK:X',
                    'USA:Approved',
                    'USA:Passed',
                    'West Germany:18')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'director',
                   'miscellaneous crew',
                   'production designer'));