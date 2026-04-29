
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND n.name_pcode_nf IN ('A3524',
                           'G6453',
                           'J5236',
                           'K2452',
                           'S5252',
                           'S53',
                           'T5162',
                           'T5165',
                           'T6236')
  AND ci.note IN ('(associate producer)',
                   '(co-producer)',
                   '(developer)',
                   '(executive producer)',
                   '(location manager)',
                   '(production coordinator)',
                   '(storyliner)',
                   '(technical consultant) (uncredited)',
                   '(written by)')
  AND rt.role IN ('miscellaneous crew',
                   'producer',
                   'writer')
  AND it1.id IN ('37');