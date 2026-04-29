WITH filtered_persons AS
  (SELECT n.id,
          n.name
   FROM name AS n
   JOIN person_info AS pi ON n.id = pi.person_id
   WHERE n.name ILIKE '%be%'
     AND pi.info_type_id IN ('33')),
     filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND kt.kind IN ('episode',
                   'movie'))
SELECT mi1.info,
       fp.name,
       COUNT(*)
FROM cast_info AS ci
JOIN filtered_persons AS fp ON ci.person_id = fp.id
JOIN filtered_movies AS fm ON ci.movie_id = fm.id
JOIN movie_info AS mi1 ON ci.movie_id = mi1.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE mi1.info_type_id IN ('7',
                  '94')
  AND mi1.info IN ('CAM:Arriflex Cameras',
                    'In: "Monthly Film Bulletin" (UK), Iss. 458, March 1972, (MG)',
                    'LAB:Boyana Film Laboratory, Sofia, Bulgaria',
                    'LAB:Cinecolor S.A., Buenos Aires, Argentina',
                    'LAB:Colorfilm Pty. Ltd., Sydney, Australia',
                    'LAB:DeLuxe',
                    'LAB:Film Center, Mumbai, India',
                    'LAB:Metrocolor',
                    'LAB:Movielab, USA',
                    'MET:2400 m',
                    'MET:2515 m',
                    'PCS:Super Panavision 70',
                    'RAT:1.37 : 1',
                    'RAT:1.78 : 1',
                    'RAT:2.00 : 1',
                    'RAT:4:3')
  AND rt.role IN ('actress',
                   'costume designer',
                   'director',
                   'miscellaneous crew',
                   'producer')
GROUP BY mi1.info,
         fp.name;