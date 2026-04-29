WITH filtered_movies AS
  (SELECT t.id,
          t.title
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.title ILIKE '%the%'
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game')),
     filtered_persons AS
  (SELECT ci.movie_id,
          n.name
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.name_pcode_nf ILIKE '%r54%'
     AND rt.role IN ('actor',
                   'actress',
                   'cinematographer',
                   'composer',
                   'director',
                   'editor',
                   'production designer')),
     filtered_companies AS
  (SELECT mc.movie_id,
          cn.name
   FROM movie_companies AS mc
   JOIN company_name AS cn ON mc.company_id = cn.id
   JOIN company_type AS ct ON mc.company_type_id = ct.id
   WHERE cn.name ILIKE '%hv%')
SELECT fm.title,
       fp.name,
       fc.name,
       COUNT(*)
FROM filtered_persons AS fp
JOIN filtered_movies AS fm ON fp.movie_id = fm.id
JOIN filtered_companies AS fc ON fp.movie_id = fc.movie_id
JOIN movie_keyword AS mk ON fp.movie_id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
GROUP BY fm.title,
         fp.name,
         fc.name
ORDER BY COUNT(*) DESC