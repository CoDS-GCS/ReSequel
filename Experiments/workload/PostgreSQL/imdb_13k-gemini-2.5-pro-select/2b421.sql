WITH t_filtered AS
  (SELECT id
   FROM title
   WHERE production_year >= 1875
     AND production_year <= 1975
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie'))),
     mi1_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('2')
     AND info IN ('Color')),
     mi2_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('6')
     AND info IN ('Mono',
                    'Silent')),
     mk_filtered AS
  (SELECT movie_id
   FROM movie_keyword
   WHERE keyword_id IN
       (SELECT id
        FROM keyword
        WHERE keyword IN ('female-frontal-nudity',
                     'flashback',
                     'gay',
                     'hospital',
                     'jealousy',
                     'lesbian-sex',
                     'marriage',
                     'mother-son-relationship',
                     'murder',
                     'oral-sex',
                     'singing',
                     'tv-mini-series',
                     'violence'))),
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
        WHERE ROLE IN ('costume designer')))
SELECT COUNT(*)
FROM t_filtered t
JOIN mi1_filtered mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered mi2 ON t.id = mi2.movie_id
JOIN mk_filtered mk ON t.id = mk.movie_id
JOIN ci_filtered ci ON t.id = ci.movie_id;