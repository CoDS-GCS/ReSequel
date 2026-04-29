
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
                   'producer',
                   'production designer')
  AND it1.id IN ('37')
  AND n.gender IN ('f',
                    'm')
  AND n.name_pcode_nf IN ('B2142',
                           'B6515',
                           'C3263',
                           'D1324',
                           'E1326',
                           'E5214',
                           'I5252',
                           'J6142',
                           'K354',
                           'L1564',
                           'M252',
                           'M5153',
                           'S521',
                           'W4525')
  AND (ci.note IN ('(executive producer)',
                   '(uncredited)',
                   '(voice: English version)',
                   '(voice: Japanese version)')
       OR ci.note IS NULL);