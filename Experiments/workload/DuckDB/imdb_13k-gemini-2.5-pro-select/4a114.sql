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
  AND n.name_pcode_nf IN ('A4524',
                           'E3632',
                           'G1641',
                           'G6212',
                           'J236',
                           'J265',
                           'J5213',
                           'J5215',
                           'J5254',
                           'J5635',
                           'M6265',
                           'N2421',
                           'N2423',
                           'P3632',
                           'W4524');