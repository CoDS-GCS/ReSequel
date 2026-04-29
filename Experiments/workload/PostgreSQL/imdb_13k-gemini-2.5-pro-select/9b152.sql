WITH filtered_movies AS
  (SELECT t.id,
          mi1.info
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
     AND mi1.info_type_id IN ('2',
                  '4',
                  '5')
     AND mi1.info IN ('Aboriginal',
                    'Australia:Refused Classification',
                    'Flemish',
                    'Georgian',
                    'Hungary:18',
                    'Israel:PG',
                    'Navajo',
                    'Pashtu',
                    'Philippines:X',
                    'Romania:I.C.-14',
                    'Romany',
                    'Sindarin',
                    'South Africa:10V',
                    'South Africa:13LS',
                    'South Africa:18',
                    'UK:R',
                    'Vietnam:(Banned)',
                    'Visayan'))
SELECT fm.info,
       n.name,
       COUNT(*)
FROM name AS n
JOIN person_info AS pi ON n.id = pi.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN filtered_movies AS fm ON ci.movie_id = fm.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE n.name ILIKE '%st%'
  AND pi.info_type_id IN ('15')
  AND rt.role IN ('actress',
                   'costume designer',
                   'director')
GROUP BY fm.info,
         n.name;