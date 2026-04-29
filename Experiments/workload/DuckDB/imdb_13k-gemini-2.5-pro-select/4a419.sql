
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
WHERE n.gender IS NULL
  AND n.name_pcode_nf IN ('A4236',
                           'A5254',
                           'D1362',
                           'H6435',
                           'I3541',
                           'J26',
                           'J4365',
                           'J52',
                           'L2162',
                           'M2425',
                           'S3126',
                           'S3152',
                           'S3212',
                           'T5214',
                           'T5251')
  AND (ci.note IN ('(as Idonnah Villarico)',
                   '(associate producer)',
                   '(audience coordinator)',
                   '(executive producer)',
                   '(producer)',
                   '(production assistant)',
                   '(technical consultant)')
       OR ci.note IS NULL)
  AND pi1.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('19'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('cinematographer',
                   'composer',
                   'costume designer',
                   'editor',
                   'miscellaneous crew',
                   'producer'));