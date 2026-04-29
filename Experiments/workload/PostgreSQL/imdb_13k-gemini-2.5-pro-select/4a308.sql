
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A2363',
                           'A3531',
                           'A5653',
                           'B6354',
                           'B652',
                           'C3265',
                           'C6464',
                           'D2162',
                           'D2425',
                           'D261',
                           'E1256',
                           'G6236',
                           'I1536',
                           'I5425',
                           'J215',
                           'J242',
                           'J5214',
                           'J5254',
                           'K1525',
                           'M2431',
                           'R2415',
                           'R2631',
                           'S5361',
                           'V5252',
                           'W4156')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN
  (SELECT person_id,
          role_id
   FROM cast_info
   WHERE note IN ('(assistant to executive producer)',
                   '(co-executive producer) (as Jim Vallely)',
                   '(co-producer)',
                   '(executive producer)',
                   '(producer)',
                   '(uncredited)',
                   '(writer)')
     OR note IS NULL) AS ci ON n.id = ci.person_id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'composer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')) AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('34')) AS it1 ON pi1.info_type_id = it1.id;