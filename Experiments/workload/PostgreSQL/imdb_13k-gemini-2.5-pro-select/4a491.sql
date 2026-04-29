WITH filtered_pi AS
  (SELECT person_id
   FROM person_info
   WHERE info_type_id IN ('31')),
     filtered_ci AS
  (SELECT person_id
   FROM cast_info ci
   JOIN role_type rt ON ci.role_id = rt.id
   WHERE rt.role IN ('actor',
                   'composer',
                   'miscellaneous crew',
                   'writer')
     AND (ci.note IN ('(story editor)',
                   '(writer)')
          OR ci.note IS NULL))
SELECT COUNT(*)
FROM name n
JOIN aka_name an ON n.id = an.person_id
JOIN filtered_pi pi ON n.id = pi.person_id
JOIN filtered_ci ci ON n.id = ci.person_id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A2463',
                           'A5326',
                           'D1326',
                           'D26',
                           'H6325',
                           'J2613',
                           'J565',
                           'O3423',
                           'W3235'));