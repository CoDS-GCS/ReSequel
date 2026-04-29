WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('A6451',
                           'B142',
                           'B3263',
                           'D5262',
                           'G4621',
                           'I525',
                           'K4521',
                           'M16',
                           'M2652',
                           'M6236',
                           'R3532',
                           'S2142',
                           'S6253')),
     filtered_cast_info AS
  (SELECT person_id,
          role_id
   FROM cast_info
   WHERE note IS NULL),
     filtered_role_type AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actress'))
SELECT COUNT(*)
FROM filtered_name AS n
JOIN filtered_cast_info AS ci ON n.id = ci.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN filtered_role_type AS rt ON rt.id = ci.role_id
WHERE pi1.info_type_id IN ('26');