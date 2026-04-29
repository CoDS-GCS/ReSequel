
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
WHERE rt.role IN ('actress',
                   'cinematographer',
                   'composer',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND (ci.note IN ('(as Rebecca Cartwright)',
                   '(assistant script editor)',
                   '(creator)',
                   '(director of photography)',
                   '(executive producer)',
                   '(production assistant)',
                   '(script supervisor)',
                   '(uncredited)',
                   '(voice)',
                   '(writer)',
                   '(written by)')
       OR ci.note IS NULL)
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A5253',
                           'A5312',
                           'A5352',
                           'B23',
                           'B2453',
                           'B4245',
                           'B5252',
                           'C3252',
                           'C4326',
                           'D4254',
                           'E3526',
                           'H4651',
                           'J523',
                           'L2324',
                           'L2362',
                           'L2645',
                           'M261',
                           'M3232',
                           'P2136',
                           'P2316',
                           'R2426',
                           'R256',
                           'S2536',
                           'S4121',
                           'V6521'))
  AND it1.id IN ('31');