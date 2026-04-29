WITH t_filtered AS
  (SELECT id
   FROM title
   WHERE production_year >= 1975
     AND production_year <= 2015
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'video movie'))),
     mi1_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('105')
     AND info IN ('$1,500',
                    '$12,000',
                    '$200',
                    '$300',
                    '$300,000',
                    '$35,000',
                    '$4,000',
                    '$5,000,000',
                    '$6,000')),
     mi2_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('4')
     AND info IN ('English')),
     mk_filtered AS
  (SELECT movie_id
   FROM movie_keyword
   WHERE keyword_id IN
       (SELECT id
        FROM keyword
        WHERE keyword IN ('based-on-novel',
                     'based-on-play',
                     'cigarette-smoking',
                     'dancing',
                     'death',
                     'doctor',
                     'family-relationships',
                     'father-son-relationship',
                     'flashback',
                     'hospital',
                     'interview',
                     'kidnapping',
                     'lesbian',
                     'love',
                     'male-frontal-nudity',
                     'marriage',
                     'number-in-title',
                     'party',
                     'singer',
                     'suicide'))),
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
        WHERE ROLE IN ('miscellaneous crew')))
SELECT COUNT(*)
FROM t_filtered t
JOIN mi1_filtered mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered mi2 ON t.id = mi2.movie_id
JOIN mk_filtered mk ON t.id = mk.movie_id
JOIN ci_filtered ci ON t.id = ci.movie_id;