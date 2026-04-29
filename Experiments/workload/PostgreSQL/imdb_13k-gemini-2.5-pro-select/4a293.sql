WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('E3623',
                           'E3631',
                           'M2414',
                           'M4232',
                           'M6243',
                           'R3265',
                           'X1656')),
     filtered_roles AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'producer',
                   'writer'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN aka_name AS an ON fn.id = an.person_id
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN filtered_roles AS fr ON ci.role_id = fr.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE it1.id IN ('37')
  AND (ci.note IN ('(producer)',
                   '(voice)',
                   '(writer)')
       OR ci.note IS NULL);