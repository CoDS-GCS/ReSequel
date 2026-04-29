
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
JOIN role_type AS rt ON rt.id = ci.role_id
WHERE n.gender IN ('f',
                    'm')
  AND n.name_pcode_nf IN ('E6256',
                           'L5325',
                           'M2434',
                           'M6251',
                           'P3624')
  AND ci.note IS NULL
  AND rt.role IN ('actor',
                   'actress')
  AND it1.id IN ('22');