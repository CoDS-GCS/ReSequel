
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON k.id = mk.keyword_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id IN ('4')
AND mi1.info IN ('English',
                    'German',
                    'Spanish')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info_type_id IN ('18')
AND mi2.info IN ('Argentina',
                    'Berlin, Germany',
                    'Boston, Massachusetts, USA',
                    'Brooklyn, New York City, New York, USA',
                    'Chicago, Illinois, USA',
                    'London, England, UK',
                    'Munich, Bavaria, Germany',
                    'New Orleans, Louisiana, USA',
                    'Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Paris, France',
                    'San Francisco, California, USA',
                    'Vancouver, British Columbia, Canada',
                    'Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA')
WHERE t.production_year BETWEEN 1975 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND n.gender IS NULL
  AND rt.role IN ('production designer');