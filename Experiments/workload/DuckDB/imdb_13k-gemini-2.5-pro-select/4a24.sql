
SELECT COUNT(*)
FROM info_type AS it1
JOIN person_info AS pi1 ON it1.id = pi1.info_type_id
JOIN name AS n ON pi1.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE it1.id IN ('31')
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('C6451',
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
                           'V5316'))
  AND (ci.note IN ('(co-executive producer)',
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
                   'writer');