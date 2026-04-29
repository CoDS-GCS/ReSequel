WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A4526',
                           'B5452',
                           'C6462',
                           'D2416',
                           'E3243',
                           'E325',
                           'G6215',
                           'J2562',
                           'J5151',
                           'J5164',
                           'J526',
                           'J5326',
                           'J624',
                           'J6352',
                           'J6561',
                           'L2414',
                           'M2563',
                           'M5461',
                           'P4141',
                           'P4636',
                           'R56',
                           'S3154',
                           'S4253',
                           'W4626',
                           'W5342'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON fn.id = an.person_id
WHERE rt.role IN ('actor',
                   'director',
                   'producer')
  AND it1.id IN ('19')
  AND (ci.note IN ('(producer)',
                   '(uncredited)',
                   '(voice: English version)')
       OR ci.note IS NULL);