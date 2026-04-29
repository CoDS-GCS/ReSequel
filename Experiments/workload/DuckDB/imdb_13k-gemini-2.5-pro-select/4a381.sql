
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE rt.role IN ('actor',
                   'actress',
                   'miscellaneous crew',
                   'producer')
  AND it1.id IN ('22')
  AND n.gender IN ('f',
                    'm')
  AND n.name_pcode_nf IN ('A5325',
                           'B1236',
                           'B41',
                           'C6425',
                           'D236',
                           'F6516',
                           'I5231',
                           'J2356',
                           'M262',
                           'S3125')
  AND (ci.note IN ('(associate producer)',
                   '(creative consultant) (as Atty. Annette Gozon-Abrogar)',
                   '(producer)',
                   '(production assistant)',
                   '(uncredited)',
                   '(voice)')
       OR ci.note IS NULL);