WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('A25',
                           'A4264',
                           'A5132',
                           'E1215',
                           'H5634',
                           'H6252',
                           'L5636',
                           'M4525',
                           'N542',
                           'P4153',
                           'V5256',
                           'Y5253'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON fn.id = an.person_id
WHERE rt.role IN ('actress')
  AND it1.id IN ('25')
  AND (ci.note IN ('(voice)')
       OR ci.note IS NULL);