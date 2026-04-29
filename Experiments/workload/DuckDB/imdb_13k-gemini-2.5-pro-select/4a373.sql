
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('C4626',
                           'D3626',
                           'J1352',
                           'J6265',
                           'K5352',
                           'O351',
                           'V6532'))
  AND (ci.note IN ('(uncredited)',
                   '(writer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'actress',
                   'composer',
                   'writer')
  AND it1.id IN ('32');