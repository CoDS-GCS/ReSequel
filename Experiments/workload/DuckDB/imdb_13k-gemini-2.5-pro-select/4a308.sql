
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE rt.role IN ('actor',
                   'composer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND it1.id IN ('34')
  AND n.gender IN ('m')
  AND n.name_pcode_nf IN ('A2363',
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
                           'W4156')
  AND (ci.note IN ('(assistant to executive producer)',
                   '(co-executive producer) (as Jim Vallely)',
                   '(co-producer)',
                   '(executive producer)',
                   '(producer)',
                   '(uncredited)',
                   '(writer)')
       OR ci.note IS NULL);