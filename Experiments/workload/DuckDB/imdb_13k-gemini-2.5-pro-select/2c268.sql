WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1990 AND 2015
     AND title IN ('(#1.772)',
                   '(#11.26)',
                   '(#5.105)',
                   '(#5.188)',
                   '(2001-03-02)',
                   '(2001-03-25)',
                   '(2007-05-21)',
                   '(2008-05-27)',
                   'A Family Affair',
                   'Caravaggio',
                   'Cherry Blossoms',
                   'Choice',
                   'Conundrum',
                   'Dogs Life',
                   'Edward Scissorhands',
                   'Everybody Says Im Fine!',
                   'Forever Hold Your Peace',
                   'From Here to Maternity',
                   'Hip Hop',
                   'Hope',
                   'I Feel Like Im in the Circus (Bangkok, Thailand)',
                   'Kahlschlag',
                   'Karma',
                   'LaToya Jackson',
                   'Lallée du roi',
                   'Live Season Finale, Part 1 of 2',
                   'Midseason Mayhem',
                   'Neuland',
                   'Prostitution',
                   'Raid',
                   'Rewind',
                   'Shes Gotta Have It',
                   'Some Enchanted Evening',
                   'Sons and Daughters',
                   'The 69th Annual Golden Globe Awards',
                   'The Pilot',
                   'To Your Health')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv series',
                   'video game',
                   'video movie'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'actress',
                   'composer',
                   'editor',
                   'producer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('18')
  AND mi2.info_type_id IN ('6')
  AND mi1.info IN ('Boston, Massachusetts, USA',
                    'Buenos Aires, Federal District, Argentina',
                    'Cologne, North Rhine - Westphalia, Germany',
                    'Dallas, Texas, USA',
                    'Germany',
                    'India',
                    'Los Angeles, California, USA',
                    'Madrid, Spain',
                    'Malibu, California, USA',
                    'Montréal, Québec, Canada',
                    'New York City, New York, USA',
                    'Portland, Oregon, USA',
                    'San Diego, California, USA',
                    'San Francisco, California, USA',
                    'Stage 25, Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA')
  AND mi2.info IN ('70 mm 6-Track',
                    'DTS-Stereo',
                    'Datasat',
                    'Dolby Digital EX',
                    'Dolby',
                    'Mono',
                    'Stereo');