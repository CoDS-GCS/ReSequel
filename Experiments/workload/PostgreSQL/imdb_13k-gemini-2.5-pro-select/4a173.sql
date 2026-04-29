WITH filtered_name AS
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
                           'Y2')),
     filtered_cast AS
  (SELECT ci.person_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE rt.role IN ('actress',
                   'miscellaneous crew',
                   'producer')
     AND (ci.note IN ('(actors director)',
                   '(executive producer)',
                   '(head animal trainer)',
                   '(producer)',
                   '(supervising executive)',
                   '(voice)')
          OR ci.note IS NULL)),
     filtered_pi AS
  (SELECT pi.person_id
   FROM person_info AS pi
   JOIN info_type AS it ON pi.info_type_id = it.id
   WHERE it.id IN ('32'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN aka_name AS an ON fn.id = an.person_id
JOIN filtered_cast AS fc ON fn.id = fc.person_id
JOIN filtered_pi AS fpi ON fn.id = fpi.person_id;