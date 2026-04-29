WITH ci_filtered AS
  (SELECT ci.person_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE ci.note IS NULL
     AND rt.role IN ('actor')),
     pi_filtered AS
  (SELECT pi1.person_id
   FROM person_info AS pi1
   WHERE pi1.info_type_id IN ('31'))
SELECT COUNT(*)
FROM name AS n
JOIN ci_filtered AS ci ON n.id = ci.person_id
JOIN pi_filtered AS pi ON n.id = pi.person_id
JOIN aka_name AS an ON n.id = an.person_id
WHERE n.gender IN ('m')
  AND n.name_pcode_nf IN ('D52',
                           'D5256',
                           'J516',
                           'J54',
                           'J6216',
                           'K6231',
                           'M24',
                           'M2414',
                           'M2425',
                           'M3252',
                           'M6354',
                           'T5256',
                           'W4362');