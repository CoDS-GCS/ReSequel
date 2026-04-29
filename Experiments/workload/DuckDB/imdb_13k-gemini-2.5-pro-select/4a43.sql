
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('22')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actress',
                   'cinematographer',
                   'composer',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A5424',
                           'C6262',
                           'E3632',
                           'F1632',
                           'F4631',
                           'F6526',
                           'H53',
                           'J3253',
                           'J5624',
                           'K23',
                           'L4512',
                           'M6262',
                           'N2425',
                           'W4361'))
  AND (ci.note IN ('(co-executive producer)',
                   '(director of photography)',
                   '(producer)',
                   '(script supervisor)')
       OR ci.note IS NULL);