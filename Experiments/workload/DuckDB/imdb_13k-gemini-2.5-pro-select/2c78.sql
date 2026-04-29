WITH t_kt AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year <= 1975
     AND t.production_year >= 1925
     AND t.title IN ('(#1.82)',
                   '(#2.12)',
                   '(#5.17)',
                   '(#6.12)',
                   '(#6.20)',
                   '(#7.17)',
                   'A Place in the Sun',
                   'Anastasia',
                   'Arsenic and Old Lace',
                   'Bad Guy',
                   'Barabbas',
                   'Cold Turkey',
                   'Deadlock',
                   'Forever Amber',
                   'Full Circle',
                   'God Is My Co-Pilot',
                   'High Stakes',
                   'Johnny Belinda',
                   'Letter from an Unknown Woman',
                   'Million Dollar Baby',
                   'One Good Turn',
                   'Running Wild',
                   'Sweet Rosie OGrady',
                   'The Arizona Kid',
                   'The Contract',
                   'The Dream',
                   'The Good Companions',
                   'The Great Race',
                   'The Hunt',
                   'The Little Minister',
                   'The Mark of Cain',
                   'The Night Riders',
                   'The Runaways',
                   'The Stranger',
                   'The Swinger',
                   'Today',
                   'Tonka',
                   'Under Two Flags',
                   'With This Ring')
     AND kt.kind IN ('tv movie',
                   'video game',
                   'video movie')),
     t_kt_ci AS
  (SELECT t_kt.id
   FROM t_kt
   JOIN cast_info AS ci ON t_kt.id = ci.movie_id
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IN ('m')
     AND rt.role IN ('cinematographer',
                   'guest')),
     t_kt_ci_mi1 AS
  (SELECT t_kt_ci.id
   FROM t_kt_ci
   JOIN movie_info AS mi1 ON t_kt_ci.id = mi1.movie_id
   WHERE mi1.info_type_id IN ('7')
     AND mi1.info IN ('LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                    'OFM:Live',
                    'PCS:Panavision',
                    'PCS:Tohoscope',
                    'PCS:Totalscope',
                    'PFM:16 mm',
                    'PFM:8 mm',
                    'RAT:1.33 : 1',
                    'RAT:1.66 : 1'))
SELECT COUNT(*)
FROM t_kt_ci_mi1
JOIN movie_info AS mi2 ON t_kt_ci_mi1.id = mi2.movie_id
WHERE mi2.info_type_id IN ('3')
  AND mi2.info IN ('Action',
                    'Animation',
                    'Family',
                    'Fantasy',
                    'History',
                    'Horror',
                    'Music',
                    'Musical',
                    'Romance',
                    'Sci-Fi',
                    'Short',
                    'Western');