
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
WHERE n.gender IN ('f',
                    'm')
  AND n.name_pcode_nf IN ('A2352',
                           'A4163',
                           'A5365',
                           'C6216',
                           'C6232',
                           'D252',
                           'G4163',
                           'J236',
                           'J265',
                           'M5421',
                           'M6342',
                           'S3151',
                           'S5242')
  AND ci.note IS NULL
  AND pi1.info_type_id IN ('22')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'actress',
                   'director'));