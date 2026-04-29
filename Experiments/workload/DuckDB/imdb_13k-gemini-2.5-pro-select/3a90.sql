WITH movies_by_keyword AS
  (SELECT DISTINCT movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('friendship',
                     'tv-mini-series')),
     movies_by_company AS
  (SELECT DISTINCT movie_id
   FROM movie_companies mc
   JOIN company_name cn ON mc.company_id = cn.id
   JOIN company_type ct ON mc.company_type_id = ct.id
   WHERE cn.country_code IN ('[no]',
                           '[ro]')
     AND ct.kind IN ('production companies')),
     movies_by_cast AS
  (SELECT DISTINCT movie_id
   FROM cast_info ci
   JOIN name n ON ci.person_id = n.id
   JOIN role_type rt ON ci.role_id = rt.id
   WHERE n.gender IN ('f')
     AND rt.role IN ('director'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movies_by_keyword AS m_k ON t.id = m_k.movie_id
JOIN movies_by_company AS m_c ON t.id = m_c.movie_id
JOIN movies_by_cast AS m_cast ON t.id = m_cast.movie_id
WHERE t.production_year BETWEEN 1900 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie');