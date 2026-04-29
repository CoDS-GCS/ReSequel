WITH filtered_roles AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('miscellaneous crew',
                   'producer')),
     filtered_info_types AS
  (SELECT id
   FROM info_type
   WHERE id IN ('19'))
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
AND ci.role_id IN
  (SELECT id
   FROM filtered_roles)
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN
  (SELECT id
   FROM filtered_info_types)
JOIN aka_name AS an ON n.id = an.person_id
WHERE n.gender IS NULL
  AND n.name_pcode_nf IN ('C235',
                           'I652',
                           'J562',
                           'M6362',
                           'N4526')
  AND ci.note IN ('(co-executive producer)',
                   '(executive producer)',
                   '(production assistant)',
                   '(series producer)',
                   '(trainee production assistant)');