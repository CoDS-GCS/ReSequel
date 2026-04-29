WITH filtered_mi1 AS
  (SELECT movie_id,
          info
   FROM movie_info
   WHERE info_type_id IN ('4',
                  '5')
     AND info IN ('Argentina:Atp',
                    'Australia:M',
                    'Brazil:14',
                    'Finland:S',
                    'France:U',
                    'French',
                    'Japanese',
                    'Netherlands:AL',
                    'Norway:15',
                    'South Korea:12',
                    'South Korea:15',
                    'Spain:T',
                    'Sweden:15',
                    'Switzerland:7',
                    'UK:12',
                    'USA:R',
                    'West Germany:12'))
SELECT fmi1.info,
       n.name,
       COUNT(*)
FROM filtered_mi1 AS fmi1
JOIN title AS t ON fmi1.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON fmi1.movie_id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi ON n.id = pi.person_id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
  AND rt.role IN ('actor',
                   'cinematographer',
                   'costume designer')
  AND n.name ILIKE '%gha%'
  AND pi.info_type_id IN ('26')
GROUP BY fmi1.info,
         n.name;