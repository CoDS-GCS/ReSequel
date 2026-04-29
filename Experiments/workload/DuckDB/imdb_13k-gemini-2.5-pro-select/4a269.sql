
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     AND name_pcode_nf IN ('A4242',
                           'H4245',
                           'H4523',
                           'J534',
                           'P4526',
                           'R2136',
                           'S6154',
                           'T6145',
                           'V6426',
                           'Y523')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('actor',
                   'actress',
                   'costume designer',
                   'writer')
  AND it1.id IN ('26')
  AND (ci.note IN ('(writer)')
       OR ci.note IS NULL);