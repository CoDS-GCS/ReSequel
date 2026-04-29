
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE rt.role IN ('actor',
                   'actress',
                   'director',
                   'producer')
  AND it1.id IN ('19')
  AND n.gender IN ('f',
                    'm')
  AND n.name_pcode_nf IN ('A6453',
                           'C6256',
                           'D6525',
                           'F6343',
                           'F6523',
                           'J3251',
                           'J454',
                           'L1565',
                           'L6212',
                           'O5651',
                           'S125',
                           'S5152',
                           'W4525')
  AND (ci.note IN ('(executive producer)',
                   '(uncredited)',
                   '(voice)')
       OR ci.note IS NULL);