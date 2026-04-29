
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
WHERE rt.role IN ('actor',
                   'actress',
                   'producer')
  AND (ci.note IN ('(credit only)',
                   '(producer)',
                   '(voice)')
       OR ci.note IS NULL)
  AND (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('B3621',
                           'C2456',
                           'C5616',
                           'E1525',
                           'K542',
                           'M3261',
                           'M6242',
                           'S2526',
                           'S4354'))
  AND it1.id IN ('26');