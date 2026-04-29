
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
WHERE t.production_year BETWEEN 1990 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video movie')
  AND it1.id IN ('17')
  AND mi1.info IN ('After the race, John Vito and Jill (Season 3) hosted a show that promoted Singapore tourism.',
                    'As of Leg 4 (Season 11), Danielle became the first person to finish higher than their original race. As of Leg 8 Charla & Mirna became the first team to finish higher than their original race.',
                    'At the age of 14, Rolly Weaver (Season 8) is the youngest person to ever win a leg and to make it to the Final Three.',
                    'In Season 9, three new countries got their first visit from the Race: Greece, Oman, and Japan, as well as the Sicily region of Italy.',
                    'Jill Aquilino originally applied with her brother for the first season of The Amazing Race.',
                    'John Keoghan, Phil Keoghan (qv)s father, was the local greeter at the Te Puke Pit Stop in New Zealand in Season 13.',
                    'Linda Weaver (Season 8) reluctantly participated in two challenges directly related to racing. One was a go-kart race in Arizona, and the other involved traveling around Talladega Superspeedway in a bicycle. Weavers husband, Roy, was killed in an accident when he was run over by a race car at Daytona International Speedway in 2004.',
                    'On Leg 8, Colin (Season 5) almost went to jail having an argument with the cab driver. Colin wanted to give the cab driver $50, but the cab driver needed $100.',
                    'Season 5 featured the first African-American and the oldest couple to win the Race (Chip & Kim), as well as the first team to win without using a Fast Foward.',
                    'The "Sledging" Detour at Okere Falls in Rotorua, New Zealand in Episode 10 is no longer a tourist activity. It was shut down by New Zealand authorities shortly after the show screened and interest in it increased, because it was deemed not safe enough. It has now reopened and is safe.')
  AND it2.id IN ('18')
  AND mi2.info IN ('Buenos Aires, Federal District, Argentina',
                    'Downtown, Los Angeles, California, USA',
                    'Ealing Studios, Ealing, London, England, UK',
                    'Istanbul, Turkey',
                    'Louisiana, USA',
                    'Moab, Utah, USA',
                    'New York, USA',
                    'Pittsburgh, Pennsylvania, USA',
                    'Seattle, Washington, USA',
                    'Sony Pictures Studios - 10202 W. Washington Blvd., Culver City, California, USA',
                    'Stage 25, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Upper Hutt, Wellington, New Zealand')
  AND rt.role IN ('actor',
                   'cinematographer',
                   'editor',
                   'writer')
  AND (n.gender IN ('m')
       OR n.gender IS NULL);