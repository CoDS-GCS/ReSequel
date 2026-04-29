WITH movie_base AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 2010
     AND kt.kind IN ('episode',
                   'movie',
                   'video movie')),
     movie_keywords AS
  (SELECT mk.movie_id
   FROM movie_keyword AS mk
   JOIN keyword AS k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('american-history',
                     'cleveland-playhouse',
                     'd.h.-lawrence',
                     'dinosaur-hunting',
                     'electioneering',
                     'imperial-seal',
                     'm.i.t.',
                     'overdue-rent',
                     'psychotropic',
                     'reference-to-hellboy',
                     'rules-of-profession',
                     'senate-confirmation-hearing',
                     'wallboard',
                     'will-to-power'))
SELECT COUNT(*)
FROM movie_base
JOIN movie_keywords ON movie_base.id = movie_keywords.movie_id
JOIN movie_info AS mi1 ON movie_base.id = mi1.movie_id
JOIN movie_info AS mi2 ON movie_base.id = mi2.movie_id
JOIN cast_info AS ci ON movie_base.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE mi1.info_type_id IN ('5')
  AND mi1.info IN ('Argentina:13',
                    'Canada:14A',
                    'Germany:16',
                    'Iceland:16',
                    'Iceland:L',
                    'Netherlands:12',
                    'Singapore:PG',
                    'Sweden:15',
                    'UK:18',
                    'USA:G',
                    'USA:PG',
                    'USA:PG-13')
  AND mi2.info_type_id IN ('6')
  AND mi2.info IN ('Dolby Digital',
                    'Dolby',
                    'Mono',
                    'SDDS',
                    'Stereo')
  AND rt.role IN ('actor',
                   'producer')
  AND (n.gender IN ('m')
       OR n.gender IS NULL);