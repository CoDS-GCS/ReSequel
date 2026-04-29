WITH filtered_pi AS
  (SELECT person_id
   FROM person_info
   WHERE info_type_id IN ('22')),
     filtered_ci AS
  (SELECT person_id
   FROM cast_info ci
   JOIN role_type rt ON ci.role_id = rt.id
   WHERE rt.role IN ('actor',
                   'director',
                   'editor',
                   'producer')
     AND (ci.note IN ('(as Joachim)',
                   '(associate producer)',
                   '(executive producer)')
          OR ci.note IS NULL))
SELECT COUNT(*)
FROM name n
JOIN aka_name an ON n.id = an.person_id
JOIN filtered_pi pi ON n.id = pi.person_id
JOIN filtered_ci ci ON n.id = ci.person_id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('B1525',
                           'C6215',
                           'E4532',
                           'J2521',
                           'N2414'));