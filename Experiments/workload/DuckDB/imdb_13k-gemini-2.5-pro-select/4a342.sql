
SELECT COUNT(*)
FROM name AS n,
     aka_name AS an,
     info_type AS it1,
     person_info AS pi1,
     cast_info AS ci,
     role_type AS rt
WHERE n.id = an.person_id
  AND n.id = pi1.person_id
  AND n.id = ci.person_id
  AND pi1.info_type_id = it1.id
  AND ci.role_id = rt.id
  AND (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('D2416',
                           'D5451',
                           'E6216',
                           'J1524',
                           'J2342',
                           'J5162',
                           'L4565',
                           'L5162',
                           'M6263',
                           'P4254',
                           'S3154',
                           'S3536'))
  AND (ci.note IN ('(associate producer)',
                   '(executive producer)',
                   '(production accountant) (as Jeffrey Angulo)',
                   '(writer)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actor',
                   'actress',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'writer'))
  AND (it1.id IN ('31'));