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
   WHERE info_type_id IN ('5')
     AND info IN ('Argentina:16',
                    'Australia:MA',
                    'Australia:R',
                    'Germany:18',
                    'Hong Kong:IIB',
                    'New Zealand:M',
                    'Norway:18',
                    'UK:15',
                    'USA:G')),
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
        WHERE keyword IN ('anthropomorphic-water',
                     'attempted-suicide',
                     'bad-friend',
                     'bed-hopping',
                     'clairvoyant',
                     'copulating-wax-people',
                     'henk-schiffmacher',
                     'lame-woman',
                     'listening-to-ones-heartbeat',
                     'marginalized',
                     'motorcycle-chase',
                     'neglected-children',
                     'premenstrual-tension',
                     'primary',
                     'prison-sex',
                     'reference-to-brenda-frazier',
                     'reference-to-peter-faberge',
                     'two-engine-p30-lightning-fighter-plane',
                     'wet-sports',
                     'working-in-the-nude',
                     'x-files',
                     'year-1500'))),
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