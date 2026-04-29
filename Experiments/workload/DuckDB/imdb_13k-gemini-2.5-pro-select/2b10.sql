WITH mi1_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('4')
     AND mi.info IN ('English',
                    'French',
                    'German',
                    'Portuguese',
                    'Spanish')),
     mi2_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('18')
     AND mi.info IN ('Barcelona, Cataluña, Spain',
                    'Berlin, Germany',
                    'CBS Studio Center - 4024 Radford Avenue, Studio City, Los Angeles, California, USA',
                    'Canada',
                    'Cologne, North Rhine - Westphalia, Germany',
                    'Denver, Colorado, USA',
                    'France',
                    'Lisbon, Portugal',
                    'Los Angeles, California, USA',
                    'Montréal, Québec, Canada',
                    'Nashville, Tennessee, USA',
                    'New Jersey, USA',
                    'Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Portland, Oregon, USA',
                    'UK'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN mi1_filtered mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND rt.role IN ('composer',
                   'costume designer')
  AND n.gender IN ('m')
  AND k.keyword IN ('gallaudet-university',
                     'ham-and-ex',
                     'khan',
                     'lighting-pipe',
                     'los-lonely-boys',
                     'reference-to-united-airlines',
                     'rich-boy-poor-girl-relationship',
                     'school-auditorium',
                     'school-voucher',
                     'scorched-summer');