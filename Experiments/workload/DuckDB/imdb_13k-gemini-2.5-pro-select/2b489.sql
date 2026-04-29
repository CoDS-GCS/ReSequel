WITH t_filtered AS
  (SELECT id
   FROM title
   WHERE production_year >= 1875
     AND production_year <= 1975
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie'))),
     mi1_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('2')
     AND info IN ('Black and White',
                    'Color')),
     mi2_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('7')
     AND info IN ('LAB:Technicolor',
                    'MET:150 m',
                    'MET:300 m',
                    'OFM:16 mm',
                    'OFM:35 mm',
                    'OFM:Video',
                    'PCS:Spherical',
                    'PFM:16 mm',
                    'PFM:Video',
                    'RAT:1.33 : 1',
                    'RAT:1.37 : 1',
                    'RAT:1.85 : 1')),
     mk_filtered AS
  (SELECT movie_id
   FROM movie_keyword
   WHERE keyword_id IN
       (SELECT id
        FROM keyword
        WHERE keyword IN ('american-canadian-relations',
                     'biker-babe',
                     'cost',
                     'gardens-of-stone',
                     'gold-tuxedo',
                     'heavenly-gates',
                     'history-mistakes',
                     'hospital-interne',
                     'lesbian-interest',
                     'linseed-oil',
                     'mark-twain-quotation',
                     'nelson-mandela-foundation',
                     'pre-raphaelite-brotherhood',
                     'rock-thrown-through-a-window',
                     'saucer',
                     'three-legged-dog',
                     'water-purification'))),
     ci_filtered AS
  (SELECT movie_id
   FROM cast_info
   WHERE person_id IN
       (SELECT id
        FROM name
        WHERE gender IS NULL)
     AND role_id IN
       (SELECT id
        FROM role_type
        WHERE ROLE IN ('writer')))
SELECT COUNT(*)
FROM t_filtered t
JOIN mi1_filtered mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered mi2 ON t.id = mi2.movie_id
JOIN mk_filtered mk ON t.id = mk.movie_id
JOIN ci_filtered ci ON t.id = ci.movie_id;