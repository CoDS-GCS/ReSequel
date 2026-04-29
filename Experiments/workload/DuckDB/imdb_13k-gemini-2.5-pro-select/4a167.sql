
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A4616',
                           'A5365',
                           'C3',
                           'J2542',
                           'J524',
                           'M2415',
                           'M6141',
                           'N2425',
                           'O245',
                           'T1234')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN
  (SELECT person_id,
          role_id
   FROM cast_info
   WHERE note IN ('(archive footage)',
                   '(co-producer)',
                   '(head writer)',
                   '(story)',
                   '(uncredited)')
     OR note IS NULL) AS ci ON n.id = ci.person_id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'producer',
                   'writer')) AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('32')) AS it1 ON pi1.info_type_id = it1.id;