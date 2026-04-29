
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
  AND (n.name_pcode_nf IN ('A4252',
                           'A5432',
                           'C6435',
                           'C6531',
                           'D241',
                           'D6215',
                           'F6326',
                           'G2162',
                           'G6215',
                           'J152',
                           'J312',
                           'J5426',
                           'J5632',
                           'L2515',
                           'L5142',
                           'M231',
                           'M6123',
                           'M6232',
                           'O2561',
                           'R253',
                           'S1562',
                           'S2542',
                           'T1526',
                           'T3656',
                           'T561'))
  AND (ci.note IN ('(associate producer)',
                   '(creator)',
                   '(executive producer)',
                   '(publicist)',
                   '(script supervisor)',
                   '(written by)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actor',
                   'actress',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer'))
  AND (it1.id IN ('34'));