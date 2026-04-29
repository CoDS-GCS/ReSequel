WITH filtered_mi1 AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   WHERE mi1.info_type_id IN ('7')
     AND mi1.info IN ('LAB:DeLuxe',
                    'LAB:Kinuta Laboratories, Tokyo, Japan',
                    'MET:300 m',
                    'MET:500 m',
                    'OFM:16 mm',
                    'PCS:Spherical',
                    'PFM:16 mm',
                    'RAT:1.37 : 1',
                    'RAT:2.20 : 1')),
     filtered_mi2 AS
  (SELECT mi2.movie_id
   FROM movie_info AS mi2
   WHERE mi2.info_type_id IN ('4')
     AND mi2.info IN ('Finnish',
                    'German',
                    'Greek',
                    'Hindi',
                    'Japanese'))
SELECT COUNT(*)
FROM title AS t
JOIN filtered_mi1 ON t.id = filtered_mi1.movie_id
JOIN filtered_mi2 ON t.id = filtered_mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN kind_type AS kt ON t.kind_id = kt.id
WHERE t.production_year BETWEEN 1925 AND 1975
  AND t.title IN ('(#2.43)',
                   '(#3.4)',
                   '(#4.31)',
                   '(#5.5)',
                   '(#5.8)',
                   '(#6.22)',
                   'A Family Affair',
                   'Ada',
                   'April Fool',
                   'Chance of a Lifetime',
                   'Crack-Up',
                   'Die gefrorenen Blitze',
                   'Dragnet',
                   'Eyewitness News',
                   'Hollywood Canteen',
                   'Hot Money',
                   'Jigsaw',
                   'Killer McCoy',
                   'Missing',
                   'Mission to Moscow',
                   'Never Say Goodbye',
                   'Oceans Eleven',
                   'Suitable for Framing',
                   'Tales of Manhattan',
                   'The Caddy',
                   'The Great Ziegfeld',
                   'The Male Animal',
                   'The Merry Widow',
                   'The Pride of the Yankees',
                   'You Cant Cheat an Honest Man',
                   'Young Love')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND rt.role IN ('costume designer',
                   'guest')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie');