WITH filtered_bridges AS
  (SELECT mk.movie_id
   FROM
     (SELECT movie_id
      FROM movie_keyword mk
      JOIN keyword k ON mk.keyword_id = k.id
      WHERE k.keyword IN ('brother-conflict',
                    'decorated-hero',
                    'dying-in-arms-of-lover',
                    'evacuation-procedure',
                    'giant-tooth',
                    'handwritten-letter',
                    'joseph-syndrome',
                    'murder-of-boyfriend',
                    'quick-draw',
                    'railgun',
                    'reference-to-ronald-dunbar',
                    'rhone-river',
                    'rubber-estate',
                    'secret-from-husband')) AS mk
   JOIN
     (SELECT movie_id
      FROM movie_companies mc
      JOIN company_name cn ON mc.company_id = cn.id
      JOIN company_type ct ON mc.company_type_id = ct.id
      WHERE cn.country_code IN ('[bg]',
                          '[cu]',
                          '[is]',
                          '[lu]',
                          '[pa]',
                          '[pe]',
                          '[pl]',
                          '[sk]',
                          '[tr]')
        AND ct.kind IN ('distributors',
                  'production companies')) AS mc ON mk.movie_id = mc.movie_id
   JOIN
     (SELECT movie_id
      FROM cast_info ci
      JOIN name n ON ci.person_id = n.id
      JOIN role_type rt ON ci.role_id = rt.id
      WHERE n.gender IN ('f')
        AND rt.role IN ('director',
                  'production designer')) AS ci ON mk.movie_id = ci.movie_id)
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN filtered_bridges AS fb ON t.id = fb.movie_id
WHERE t.production_year > 1925
  AND t.production_year <= 2015
  AND kt.kind IN ('episode',
                  'movie',
                  'video movie');