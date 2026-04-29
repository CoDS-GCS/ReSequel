WITH t_filtered AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'video movie')),
     mi1_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('3')
     AND mi.info IN ('Comedy',
                    'Crime',
                    'Documentary',
                    'Drama',
                    'Fantasy',
                    'Mystery',
                    'Short',
                    'Thriller')),
     mi2_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('18')
     AND mi.info IN ('Austin, Texas, USA',
                    'Berlin, Germany',
                    'Brooklyn, New York City, New York, USA',
                    'Chicago, Illinois, USA',
                    'London, England, UK',
                    'Los Angeles, California, USA',
                    'Madrid, Spain',
                    'New York City, New York, USA',
                    'San Francisco, California, USA',
                    'Sydney, New South Wales, Australia',
                    'Washington, District of Columbia, USA')),
     ci_filtered AS
  (SELECT ci.movie_id
   FROM cast_info ci
   JOIN role_type rt ON ci.role_id = rt.id
   JOIN name n ON ci.person_id = n.id
   WHERE rt.role IN ('editor')
     AND n.gender IN ('f')),
     mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('bare-breasts',
                     'bare-chested-male',
                     'based-on-novel',
                     'character-name-in-title',
                     'dancing',
                     'death',
                     'female-nudity',
                     'lesbian-sex',
                     'male-frontal-nudity',
                     'marriage',
                     'mother-daughter-relationship',
                     'new-york-city',
                     'nudity',
                     'number-in-title',
                     'one-word-title',
                     'oral-sex',
                     'sequel',
                     'singing',
                     'suicide',
                     'surrealism'))
SELECT COUNT(*)
FROM t_filtered t
JOIN mi1_filtered mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered mi2 ON t.id = mi2.movie_id
JOIN ci_filtered ci ON t.id = ci.movie_id
JOIN mk_filtered mk ON t.id = mk.movie_id;