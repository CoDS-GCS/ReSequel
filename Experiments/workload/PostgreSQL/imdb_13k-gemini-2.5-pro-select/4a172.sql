WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('A2425',
                           'B5145',
                           'H3142',
                           'L346',
                           'L6135',
                           'V4643',
                           'Y6232')),
     filtered_roles AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actress'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN aka_name AS an ON fn.id = an.person_id
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN filtered_roles AS fr ON ci.role_id = fr.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE it1.id IN ('25')
  AND (ci.note IN ('(uncredited)')
       OR ci.note IS NULL);