WITH movie_subset AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND kt.kind IN ('tv series',
                   'video game',
                   'video movie'))
SELECT COUNT(*)
FROM movie_subset
INNER JOIN movie_info mi1 ON movie_subset.id = mi1.movie_id
INNER JOIN info_type it1 ON mi1.info_type_id = it1.id
INNER JOIN movie_info mi2 ON movie_subset.id = mi2.movie_id
INNER JOIN info_type it2 ON mi2.info_type_id = it2.id
INNER JOIN cast_info ci ON movie_subset.id = ci.movie_id
INNER JOIN name n ON ci.person_id = n.id
INNER JOIN role_type rt ON ci.role_id = rt.id
WHERE it1.id IN ('18')
  AND mi1.info IN ('Buenos Aires, Federal District, Argentina',
                    'CBS Studio 50, New York City, New York, USA',
                    'CBS Television City - 7800 Beverly Blvd., Fairfax, Los Angeles, California, USA',
                    'Chicago, Illinois, USA',
                    'Lisbon, Portugal',
                    'Mexico City, Distrito Federal, Mexico',
                    'Mexico',
                    'New York City, New York, USA',
                    'Paris, France',
                    'Philippines',
                    'Revue Studios, Hollywood, Los Angeles, California, USA',
                    'San Francisco, California, USA',
                    'Shepperton Studios, Shepperton, Surrey, England, UK',
                    'Spain',
                    'Sydney, New South Wales, Australia')
  AND it2.id IN ('8')
  AND mi2.info IN ('Argentina',
                    'Australia',
                    'Belgium',
                    'Brazil',
                    'Canada',
                    'Finland',
                    'France',
                    'India',
                    'Italy',
                    'Mexico',
                    'Netherlands',
                    'Philippines')
  AND n.gender IS NULL
  AND rt.role IN ('miscellaneous crew');