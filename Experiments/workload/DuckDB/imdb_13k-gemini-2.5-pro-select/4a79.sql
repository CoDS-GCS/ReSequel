
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE rt.role IN ('actress',
                   'writer')
  AND it1.id IN ('19')
  AND n.gender IN ('f')
  AND n.name_pcode_nf IN ('A5635',
                           'B623',
                           'C6526',
                           'E162',
                           'E4213',
                           'G6236',
                           'H546',
                           'I5362',
                           'J4163',
                           'J4265',
                           'J4514',
                           'K321',
                           'K6235',
                           'M2525',
                           'M2532',
                           'N3454',
                           'P253',
                           'R2414',
                           'S216',
                           'S242',
                           'S436',
                           'T3251',
                           'V5245')
  AND (ci.note IN ('(credit only)',
                   '(voice) (as E.G. Daily)',
                   '(voice)',
                   '(writer)')
       OR ci.note IS NULL);