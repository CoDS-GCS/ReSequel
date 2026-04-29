
SELECT COUNT(*)
FROM title AS t,
     cast_info AS ci,
     movie_info AS mi1,
     movie_info AS mi2
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.production_year <= 1990
  AND t.production_year >= 1950
  AND t.title IN ('(#1.274)',
                   '(#1.314)',
                   '(#1.408)',
                   '(#1.595)',
                   '(#1.722)',
                   '(#1.844)',
                   '(#2.42)',
                   '(#5.23)',
                   'Accused',
                   'But Not for Me',
                   'Christina',
                   'Constance',
                   'Der kaukasische Kreidekreis',
                   'Easy to Love',
                   'Game 7',
                   'Haunted',
                   'Holiday',
                   'Home Sweet Home',
                   'Home Sweet Homeless',
                   'Hunter',
                   'Key Exchange',
                   'Man and Boy',
                   'Meanwhile, Back at the Ranch',
                   'Night School',
                   'Night of One Hundred Stars',
                   'No Strings',
                   'Nothing Personal',
                   'Part 9',
                   'Schlagerparade',
                   'Spring Fever',
                   'Starman',
                   'Stephen',
                   'Strangers on a Train',
                   'The Best Little Whorehouse in Texas',
                   'The Bunker',
                   'The Car',
                   'The Experiment',
                   'The Family Man',
                   'The Final Sanction',
                   'The Gift',
                   'The High and the Mighty',
                   'The Little Sister',
                   'The Phoenix',
                   'The Quality of Mercy',
                   'The Vigil',
                   'Wheres Poppa?',
                   'You Better Watch Out')
  AND mi1.info_type_id IN ('18')
  AND mi1.info IN ('Cinecittà Studios, Cinecittà, Rome, Lazio, Italy',
                    'Dallas, Texas, USA',
                    'Las Vegas, Nevada, USA',
                    'Stage 14, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 24, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 4, Stage 1, NBC Studios - 3000 W. Alameda Avenue, Burbank, California, USA',
                    'Stage 6, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Sydney, New South Wales, Australia',
                    'Vasquez Rocks Natural Area Park - 10700 W. Escondido Canyon Rd., Agua Dulce, California, USA')
  AND mi2.info_type_id IN ('7')
  AND mi2.info IN ('LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                    'LAB:DeLuxe, Hollywood (CA), USA',
                    'LAB:Rank Film Laboratories, Denham, UK',
                    'OFM:35 mm',
                    'PCS:Kinescope')
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
                   'cinematographer',
                   'guest',
                   'producer'));