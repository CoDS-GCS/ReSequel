
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('22')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actress',
                   'cinematographer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A2426',
                           'A4163',
                           'A525',
                           'A5263',
                           'A5324',
                           'C252',
                           'C6256',
                           'H216',
                           'H25',
                           'J1362',
                           'J1621',
                           'J2124',
                           'J2526',
                           'J5262',
                           'J543',
                           'K4262',
                           'L5652',
                           'R5251',
                           'S2562',
                           'S3132',
                           'S6212',
                           'Z254'))
  AND (ci.note IN ('(consulting producer)',
                   '(creative head: tv dramatic series, CBC)',
                   '(lighting director) (as Alfredo Hernando)',
                   '(producer)',
                   '(production assistant)',
                   '(production intern)',
                   '(production staff)',
                   '(public relations)',
                   '(set teacher)',
                   '(supervising producer)',
                   '(writer)',
                   '(written by)')
       OR ci.note IS NULL);