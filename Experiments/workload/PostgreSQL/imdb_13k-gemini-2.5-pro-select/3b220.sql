WITH filtered_movies AS
  (SELECT t.id,
          t.title
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.title ILIKE '%gh%'
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
   WHERE n.name_pcode_nf ILIKE '%k54%'
     AND rt.role IN ('actress',
                   'cinematographer',
                   'composer',
                   'miscellaneous crew')),
     filtered_companies AS
  (SELECT mc.movie_id,
          cn.name
   FROM movie_companies AS mc
   JOIN company_name AS cn ON mc.company_id = cn.id
   JOIN company_type AS ct ON mc.company_type_id = ct.id
   WHERE cn.name ILIKE '%cb%')
SELECT fm.title,
       fp.name,
       fc.name,
       COUNT(*)
FROM filtered_movies AS fm
JOIN filtered_persons AS fp ON fm.id = fp.movie_id
JOIN filtered_companies AS fc ON fm.id = fc.movie_id
JOIN movie_keyword AS mk ON fm.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
GROUP BY fm.title,
         fp.name,
         fc.name
ORDER BY COUNT(*) DESC