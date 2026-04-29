
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('A5361',
                           'A6146',
                           'B6342',
                           'C5426',
                           'D2',
                           'D5146',
                           'D5262',
                           'E5356',
                           'F352',
                           'H4241',
                           'J362',
                           'K3123',
                           'L3123',
                           'L316',
                           'R2425',
                           'S1342',
                           'S5364',
                           'S5425',
                           'V12',
                           'V5323')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN
  (SELECT person_id,
          role_id
   FROM cast_info
   WHERE note IN ('(head writer)',
                   '(nucleus director)',
                   '(producer)',
                   '(production coordinator)',
                   '(voice)',
                   '(writer)')
     OR note IS NULL) AS ci ON n.id = ci.person_id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actress',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')) AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('26')) AS it1 ON pi1.info_type_id = it1.id;