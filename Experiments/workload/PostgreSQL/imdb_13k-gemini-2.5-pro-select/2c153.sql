WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1875 AND 1975
     AND title IN ('(#1.62)',
                   '(#1.94)',
                   '(#3.30)',
                   '(#5.3)',
                   '(#6.2)',
                   '(#7.15)',
                   'A Christmas Carol',
                   'A Life of Her Own',
                   'A Night Out',
                   'Angels with Dirty Faces',
                   'As Pupilas do Senhor Reitor',
                   'As the World Turns',
                   'Az aranyember',
                   'Blockade',
                   'Breakdown',
                   'Der Bettelstudent',
                   'Der Hauptmann von Köpenick',
                   'Der Meineidbauer',
                   'Ever Since Eve',
                   'Everybody Does It',
                   'Hunt the Man Down',
                   'Manhunt',
                   'Maya',
                   'Of Human Bondage',
                   'Once in a Lifetime',
                   'Pressure Point',
                   'Rip Van Winkle',
                   'Sarajevski atentat',
                   'Sergeant York',
                   'Something to Live For',
                   'Tartuffe',
                   'Terza puntata',
                   'Thats Entertainment!',
                   'The Baby Sitter',
                   'The Candidate',
                   'The Cardinal',
                   'The Champ',
                   'The Comic',
                   'The General',
                   'The Gift',
                   'The Locket',
                   'The Meeting',
                   'The Public Menace',
                   'The Reckoning',
                   'The Teacher',
                   'The Wanderer',
                   'Tosca',
                   'Yotsuya kaidan')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
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
   WHERE ROLE IN ('actor',
                   'composer',
                   'editor',
                   'miscellaneous crew'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('7')
  AND mi2.info_type_id IN ('3')
  AND mi1.info IN ('LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                    'MET:12.2 m',
                    'MET:135 m',
                    'MET:140 m',
                    'MET:15.2 m',
                    'MET:170 m',
                    'MET:18.3 m',
                    'MET:200 m',
                    'MET:45.7 m',
                    'MET:600 m',
                    'MET:75 m',
                    'OFM:16 mm',
                    'PCS:Dyaliscope',
                    'PFM:8 mm',
                    'RAT:2.20 : 1')
  AND mi2.info IN ('Action',
                    'Adult',
                    'Adventure',
                    'Animation',
                    'Comedy',
                    'Drama',
                    'Family',
                    'Fantasy',
                    'Film-Noir',
                    'Musical',
                    'Short',
                    'Thriller',
                    'War');