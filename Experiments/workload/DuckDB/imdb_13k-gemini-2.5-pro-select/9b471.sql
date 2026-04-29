WITH filtered_ci AS
  (SELECT ci.movie_id,
          ci.person_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE rt.role IN ('actor',
                   'actress',
                   'cinematographer',
                   'composer',
                   'costume designer'))
SELECT mi1.info,
       n.name,
       COUNT(*)
FROM filtered_ci AS fci
JOIN title AS t ON fci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON fci.movie_id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN name AS n ON fci.person_id = n.id
JOIN person_info AS pi ON n.id = pi.person_id
JOIN info_type AS it2 ON pi.info_type_id = it2.id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
  AND it1.id IN ('3',
                  '4',
                  '5')
  AND mi1.info IN ('Animation',
                    'Argentina:Atp',
                    'Biography',
                    'Finland:K-11',
                    'France:-12',
                    'Hindi',
                    'Malaysia:U',
                    'Musical',
                    'New Zealand:M',
                    'Norway:15',
                    'Singapore:M18',
                    'South Korea:12',
                    'Spain:18',
                    'Sweden:11',
                    'Sweden:7',
                    'Switzerland:12',
                    'Switzerland:7',
                    'UK:PG')
  AND n.name ILIKE '%sale%'
  AND it2.id IN ('29')
GROUP BY mi1.info,
         n.name;