WITH filtered_bridges AS
  (SELECT mk.movie_id
   FROM
     (SELECT movie_id
      FROM movie_keyword mk
      JOIN keyword k ON mk.keyword_id = k.id
      WHERE k.keyword IN ('car-repair',
                    'crush-phone-with-foot',
                    'declassified-government-document',
                    'father-daughter-romance',
                    'finding-ones-way-home',
                    'going-steady',
                    'greenhouse-gas',
                    'minho-portugal',
                    'overlord',
                    'trees-for-israel',
                    'underground-water',
                    'winter')) AS mk
   JOIN
     (SELECT movie_id
      FROM movie_companies mc
      JOIN company_name cn ON mc.company_id = cn.id
      JOIN company_type ct ON mc.company_type_id = ct.id
      WHERE cn.country_code IN ('[cl]',
                          '[co]',
                          '[cz]',
                          '[lu]',
                          '[no]',
                          '[pe]',
                          '[ro]',
                          '[th]',
                          '[ve]')
        AND ct.kind IN ('distributors',
                  'production companies')) AS mc ON mk.movie_id = mc.movie_id
   JOIN
     (SELECT movie_id
      FROM cast_info ci
      JOIN name n ON ci.person_id = n.id
      JOIN role_type rt ON ci.role_id = rt.id
      WHERE n.gender IN ('f')
        AND rt.role IN ('producer')) AS ci ON mk.movie_id = ci.movie_id)
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN filtered_bridges AS fb ON t.id = fb.movie_id
WHERE t.production_year > 1990
  AND t.production_year <= 2015
  AND kt.kind IN ('episode',
                  'movie',
                  'video movie');