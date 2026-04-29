WITH t_filtered AS
  (SELECT id
   FROM title
   WHERE production_year >= 1950
     AND production_year <= 2010
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'video movie'))),
     mi1_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('4')
     AND info IN ('Dutch',
                    'English',
                    'French',
                    'German',
                    'Italian',
                    'Mandarin',
                    'Spanish',
                    'Swedish')),
     mi2_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('7')
     AND info IN ('LAB:DuArt Film Laboratories Inc., New York, USA',
                    'OFM:16 mm',
                    'OFM:35 mm',
                    'PCS:HDTV',
                    'PFM:16 mm',
                    'PFM:35 mm',
                    'PFM:70 mm',
                    'RAT:1.33 : 1',
                    'RAT:1.78 : 1',
                    'RAT:1.85 : 1',
                    'RAT:4:3')),
     mk_filtered AS
  (SELECT movie_id
   FROM movie_keyword
   WHERE keyword_id IN
       (SELECT id
        FROM keyword
        WHERE keyword IN ('cab-driver',
                     'gasoline-sniffing',
                     'todd',
                     'year-1939',
                     'zippered-gloves'))),
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
        WHERE ROLE IN ('composer')))
SELECT COUNT(*)
FROM t_filtered t
JOIN mi1_filtered mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered mi2 ON t.id = mi2.movie_id
JOIN mk_filtered mk ON t.id = mk.movie_id
JOIN ci_filtered ci ON t.id = ci.movie_id;