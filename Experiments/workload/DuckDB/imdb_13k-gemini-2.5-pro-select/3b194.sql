
SELECT t.title,
       n.name,
       cn.name,
       COUNT(*)
FROM title AS t,
     movie_keyword AS mk,
     keyword AS k,
     movie_companies AS mc,
     company_name AS cn,
     kind_type AS kt,
     cast_info AS ci,
     name AS n,
     role_type AS rt
WHERE t.id = mk.movie_id
  AND t.id = mc.movie_id
  AND t.id = ci.movie_id
  AND ci.movie_id = mc.movie_id
  AND ci.movie_id = mk.movie_id
  AND mk.movie_id = mc.movie_id
  AND k.id = mk.keyword_id
  AND cn.id = mc.company_id
  AND kt.id = t.kind_id
  AND ci.person_id = n.id
  AND ci.role_id = rt.id
  AND t.title ILIKE '%wom%'
  AND n.name_pcode_nf ILIKE '%j21%'
  AND cn.name ILIKE '%pro%'
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
  AND rt.role IN ('actor',
                   'actress',
                   'cinematographer',
                   'composer',
                   'costume designer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'production designer',
                   'writer')
GROUP BY t.title,
         n.name,
         cn.name
ORDER BY COUNT(*) DESC;