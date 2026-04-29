WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1875 AND 1975
     AND title IN ('(#1.20)',
                   '(#1.34)',
                   '(#2.44)',
                   '(#4.34)',
                   '(#6.19)',
                   'Ada',
                   'Airport 1975',
                   'Angel',
                   'Anything Goes',
                   'Arrival',
                   'Bathing Beauty',
                   'Black Sheep',
                   'Boy Meets Girl',
                   'Bright Lights',
                   'Buried Treasure',
                   'Caravan',
                   'Counter-Attack',
                   'Deadfall',
                   'Der Feldherrnhügel',
                   'Easy Money',
                   'False Witness',
                   'Foreign Correspondent',
                   'Forever Amber',
                   'Golden Boy',
                   'Gypsy',
                   'High Tension',
                   'Hypnotized',
                   'Jeder stirbt für sich allein',
                   'Les misérables',
                   'Night and Day',
                   'Raffles',
                   'Summer Holiday',
                   'The Blue Knight',
                   'The Buccaneer',
                   'The Glorious Adventure',
                   'The Godfather',
                   'The Great Ziegfeld',
                   'The Hunted',
                   'The Importance of Being Earnest',
                   'The Monster',
                   'The Old Curiosity Shop',
                   'The Pursuit of Happiness',
                   'The Silver Chalice',
                   'The Squaw Man',
                   'The Ten Commandments',
                   'The Unknown',
                   'The Warning',
                   'You and Me')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'video game',
                   'video movie'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actress',
                   'guest',
                   'miscellaneous crew'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('18')
  AND mi2.info_type_id IN ('7')
  AND mi1.info IN ('Berlin, Germany',
                    'Big Bear Lake, Big Bear Valley, San Bernardino National Forest, California, USA',
                    'Buffalo, New York, USA',
                    'General Service Studios - 1040 N. Las Palmas, Hollywood, Los Angeles, California, USA',
                    'Madrid, Spain',
                    'RKO-Pathé Studios - 9336 Washington Blvd., Culver City, California, USA',
                    'Santa Paula, California, USA',
                    'Sevilla, Andalucía, Spain',
                    'Stage 18, Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Twickenham Film Studios, St Margarets, Twickenham, Middlesex, England, UK',
                    'Vasquez Rocks Natural Area Park - 10700 W. Escondido Canyon Rd., Agua Dulce, California, USA')
  AND mi2.info IN ('CAM:Panavision Cameras and Lenses',
                    'LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                    'LAB:DeLuxe',
                    'MET:',
                    'OFM:35 mm',
                    'OFM:Live',
                    'PCS:Spherical',
                    'PFM:70 mm',
                    'PFM:Video',
                    'RAT:1.20 : 1',
                    'RAT:1.37 : 1',
                    'RAT:1.66 : 1',
                    'RAT:2.35 : 1',
                    'RAT:4:3');