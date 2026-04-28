SELECT MIN(an.name) AS acress_pseudonym,
       MIN(t.title) AS japanese_anime_movie
FROM aka_name AS an,
     cast_info AS ci,
     company_name AS cn,
     movie_companies AS mc,
     name AS n,
     role_type AS rt,
     title AS t
WHERE ci.note =&&&
  AND cn.country_code =&&&
  AND mc.note like &&&
  AND mc.note not like &&&
  AND (mc.note like &&&
       OR mc.note like &&&)
  AND n.name like &&&
  AND n.name not like &&&
  AND rt.role =&&&
  AND t.production_year BETWEEN ### AND ###
  AND (t.title like &&&
       OR t.title like &&&)
  AND an.person_id = n.id
  AND n.id = ci.person_id
  AND ci.movie_id = t.id
  AND t.id = mc.movie_id
  AND mc.company_id = cn.id
  AND ci.role_id = rt.id
  AND an.person_id = ci.person_id
  AND ci.movie_id = mc.movie_id;