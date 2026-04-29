WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     AND name_pcode_nf IN ('A4536',
                           'B4241',
                           'B5165',
                           'C5254',
                           'C6252',
                           'D1316',
                           'D1325',
                           'G1641',
                           'H6243',
                           'K3625',
                           'L616',
                           'M5142',
                           'N2132',
                           'S4524',
                           'T521',
                           'V6254',
                           'W4132',
                           'Y2526')),
     filtered_roles AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'actress',
                   'producer'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN aka_name AS an ON fn.id = an.person_id
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN filtered_roles AS fr ON ci.role_id = fr.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE it1.id IN ('37')
  AND (ci.note IN ('(co-executive producer)',
                   '(executive producer)',
                   '(voice)')
       OR ci.note IS NULL);