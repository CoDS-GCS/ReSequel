
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('A1643',
                           'A4253',
                           'A546',
                           'B4521',
                           'C3651',
                           'C5',
                           'C6531',
                           'E3142',
                           'F5414',
                           'I1525',
                           'I2145',
                           'K1463',
                           'K3435',
                           'K6235',
                           'L2325',
                           'L4316',
                           'L5426',
                           'M2415',
                           'M636',
                           'M6414',
                           'N652',
                           'P4216',
                           'S2615',
                           'Y2')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('actress',
                   'miscellaneous crew',
                   'producer')
  AND it1.id IN ('32')
  AND (ci.note IN ('(actors director)',
                   '(executive producer)',
                   '(head animal trainer)',
                   '(producer)',
                   '(supervising executive)',
                   '(voice)')
       OR ci.note IS NULL);