WITH filtered_kt AS
  (SELECT id
   FROM kind_type
   WHERE kind IN ('tv movie',
                   'tv series')),
     filtered_k AS
  (SELECT id
   FROM keyword
   WHERE keyword IN ('burial',
                     'ground-penetrating-radar',
                     'lava-stream',
                     'mystery-rider',
                     'pure-grain-alcohol',
                     'relaxation-tape',
                     'showagon',
                     'terran')),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('cinematographer',
                   'production designer')),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     OR gender IS NULL)
SELECT COUNT(*)
FROM title AS t
JOIN filtered_kt ON t.kind_id = filtered_kt.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN filtered_k ON mk.keyword_id = filtered_k.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_rt ON ci.role_id = filtered_rt.id
JOIN filtered_n ON ci.person_id = filtered_n.id
WHERE t.production_year BETWEEN 1950 AND 2010
  AND mi1.info_type_id IN ('8')
  AND mi1.info IN ('Australia',
                    'Canada',
                    'France',
                    'Mexico',
                    'Spain',
                    'UK',
                    'USA')
  AND mi2.info_type_id IN ('18')
  AND mi2.info IN ('Boston, Massachusetts, USA',
                    'Desilu Studios - 9336 W. Washington Blvd., Culver City, California, USA',
                    'Las Vegas, Nevada, USA',
                    'London, England, UK',
                    'Madrid, Spain',
                    'Metro-Goldwyn-Mayer Studios - 10202 W. Washington Blvd., Culver City, California, USA',
                    'Mexico City, Distrito Federal, Mexico',
                    'Paris, France',
                    'Stage 9, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Sydney, New South Wales, Australia',
                    'Toronto, Ontario, Canada',
                    'USA',
                    'Vancouver, British Columbia, Canada');