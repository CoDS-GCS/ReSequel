WITH t_filtered AS
  (SELECT id
   FROM title
   WHERE production_year >= 1990
     AND production_year <= 2015
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('tv movie',
                   'video game'))),
     mi1_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('105')
     AND info IN ('$10,000')),
     mi2_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('6')
     AND info IN ('Stereo')),
     mk_filtered AS
  (SELECT movie_id
   FROM movie_keyword
   WHERE keyword_id IN
       (SELECT id
        FROM keyword
        WHERE keyword IN ('anal-sex',
                     'based-on-play',
                     'father-son-relationship',
                     'hardcore',
                     'husband-wife-relationship',
                     'independent-film',
                     'lesbian',
                     'new-york-city',
                     'party',
                     'revenge',
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
        WHERE ROLE IN ('editor')))
SELECT COUNT(*)
FROM t_filtered t
JOIN mi1_filtered mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered mi2 ON t.id = mi2.movie_id
JOIN mk_filtered mk ON t.id = mk.movie_id
JOIN ci_filtered ci ON t.id = ci.movie_id;