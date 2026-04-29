
SELECT COUNT(*)
FROM
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
                           'V2514')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN
  (SELECT person_id,
          role_id
   FROM cast_info
   WHERE note IN ('(uncredited)',
                   '(voice)',
                   '(voice: English version)')
     OR note IS NULL) AS ci ON n.id = ci.person_id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'actress',
                   'director')) AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('22')) AS it1 ON pi1.info_type_id = it1.id;