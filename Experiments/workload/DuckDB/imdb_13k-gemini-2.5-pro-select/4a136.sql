
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
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A5162',
                           'A5242',
                           'B6521',
                           'D5263',
                           'E3632',
                           'H5425',
                           'I5216',
                           'J1631',
                           'J5162',
                           'P4525',
                           'T5262',
                           'V212'))
  AND (ci.note IN ('(child acting coach)',
                   '(co-executive producer)',
                   '(executive producer)',
                   '(production assistant)',
                   '(promo producer)',
                   '(uncredited)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actress',
                   'cinematographer',
                   'editor',
                   'miscellaneous crew',
                   'producer'))
  AND (it1.id IN ('37'));