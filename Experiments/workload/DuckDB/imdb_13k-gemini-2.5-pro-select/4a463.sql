WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('F6316',
                           'G524',
                           'K4621',
                           'L5241',
                           'M1431',
                           'M5345',
                           'M6364',
                           'R1216',
                           'S52',
                           'S6156',
                           'T215',
                           'T435',
                           'Y53'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON fn.id = an.person_id
WHERE rt.role IN ('actress',
                   'composer')
  AND it1.id IN ('26')
  AND (ci.note IN ('(voice)')
       OR ci.note IS NULL);