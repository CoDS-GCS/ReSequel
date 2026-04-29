WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     AND name_pcode_nf IN ('A6525',
                           'B5212',
                           'B523',
                           'B6535',
                           'C6424',
                           'D4532',
                           'E3452',
                           'G1641',
                           'G6263',
                           'H614',
                           'I4256',
                           'J45',
                           'J524',
                           'K3514',
                           'L6514',
                           'L6521',
                           'M2652',
                           'S325',
                           'S52',
                           'V2514')),
     filtered_roles AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'actress',
                   'director'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN aka_name AS an ON fn.id = an.person_id
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN filtered_roles AS fr ON ci.role_id = fr.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE it1.id IN ('22')
  AND (ci.note IN ('(uncredited)',
                   '(voice)',
                   '(voice: English version)')
       OR ci.note IS NULL);