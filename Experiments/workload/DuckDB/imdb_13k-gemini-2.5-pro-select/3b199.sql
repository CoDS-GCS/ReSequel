WITH filtered_titles AS
  (SELECT t.id,
          t.title
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.title ILIKE '%lie%'
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video movie')),
     filtered_names AS
  (SELECT n.id,
          n.name
   FROM name n
   WHERE n.name_pcode_nf ILIKE '%c25%'),
     filtered_companies AS
  (SELECT cn.id,
          cn.name
   FROM company_name cn
   WHERE cn.name ILIKE '%tele%')
SELECT ft.title,
       fn.name,
       fc.name,
       COUNT(*)
FROM filtered_titles AS ft
JOIN movie_keyword AS mk ON ft.id = mk.movie_id
JOIN movie_companies AS mc ON ft.id = mc.movie_id
JOIN filtered_companies AS fc ON mc.company_id = fc.id
JOIN cast_info AS ci ON ft.id = ci.movie_id
JOIN filtered_names AS fn ON ci.person_id = fn.id
WHERE ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('composer',
                   'director',
                   'editor'))
GROUP BY ft.title,
         fn.name,
         fc.name
ORDER BY COUNT(*) DESC;