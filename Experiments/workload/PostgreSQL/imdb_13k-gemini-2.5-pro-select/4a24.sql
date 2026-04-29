
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE (gender IN ('f')
          OR gender IS NULL)
     AND (name_pcode_nf IN ('C6451',
                           'E4213',
                           'E6254',
                           'H5326',
                           'H6214',
                           'H6524',
                           'J653',
                           'K5126',
                           'K56',
                           'L6521',
                           'M23',
                           'M252',
                           'M265',
                           'M6232',
                           'P4123',
                           'S4512',
                           'T5256',
                           'T561',
                           'V5316'))) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN
  (SELECT ci.person_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON rt.id = ci.role_id
   WHERE (ci.note IN ('(co-executive producer)',
                   '(credit only)',
                   '(director of photography)',
                   '(executive producer)',
                   '(mcr production assistant)',
                   '(producer)',
                   '(production coordinator)',
                   '(stage manager)',
                   '(unspecified crew member)',
                   '(voice)',
                   '(written by)')
          OR ci.note IS NULL)
     AND rt.role IN ('actress',
                   'cinematographer',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')) AS ci ON n.id = ci.person_id
JOIN
  (SELECT pi1.person_id
   FROM person_info AS pi1
   WHERE pi1.info_type_id IN ('31')) AS pi1 ON n.id = pi1.person_id;