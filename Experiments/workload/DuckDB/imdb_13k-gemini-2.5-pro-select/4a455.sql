
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE rt.role IN ('actor',
                   'actress',
                   'composer',
                   'costume designer',
                   'miscellaneous crew',
                   'writer')
  AND it1.id IN ('37')
  AND n.gender IN ('f',
                    'm')
  AND n.name_pcode_nf IN ('A5265',
                           'B6215',
                           'B6531',
                           'D5425',
                           'D6342',
                           'E3246',
                           'F6524',
                           'J3435',
                           'J5421',
                           'J6245',
                           'L621',
                           'N6563',
                           'U6265')
  AND (ci.note IN ('(archive footage) (as Franklin Delano Roosevelt)',
                   '(archive footage) (as Sen. Barack Obama)',
                   '(horse wrangler)',
                   '(uncredited)',
                   '(voice: English version)',
                   '(written by)')
       OR ci.note IS NULL);